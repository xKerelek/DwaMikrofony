/*
 Projekt: Zaawansowane programowanie systemów wbudowanych

Blady Bartłomiej numer albumu: 36362
Dąbrowki Oskar numer albumu: 36369
Nowak Karol numer albumu: 36782
Wiatr Krystian numer albumu: 36415

 */

#include <stdio.h>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "LPC55S69_cm33_core0.h"
#include "fsl_debug_console.h"
#include "lcd.h"
#include "arm_math.h"
#include "arm_const_structs.h"
#include "fsl_powerquad.h"
#include "fsl_power.h"
#include <complex.h>

#define N 512
#define N2 (2*N)
#define NFFT (2*N2)
#define V 340
#define FP 48000.0
#define L 0.1
#define M 1

float x1[N2]={0} , x2[N2]={0};
uint16_t dataBuffer1[N]={0} , dataBuffer2[N]={0};
uint32_t wr=0;
bool dataReady = false;
lpadc_conv_result_t g_LpadcResultConfigStruct;

q31_t y[NFFT]={0};
float g1[NFFT]={0} , g2[NFFT]={0} , g12[NFFT]={0};
int result;
uint16_t counter = N2;
float complex z;

typedef struct element{
	uint32_t index;
	float value;
}element;

element sortTab[NFFT] = {0};

/* ADC0_IRQn interrupt handler */
void ADC0_IRQHANDLER(void)
{
	LPADC_GetConvResult(ADC0, &g_LpadcResultConfigStruct, 0U);
	if(!dataReady) {
		dataBuffer1[wr]=g_LpadcResultConfigStruct.convValue;
	}

	LPADC_GetConvResult(ADC0, &g_LpadcResultConfigStruct, 0U);
	if(!dataReady) {
		dataBuffer2[wr++]=g_LpadcResultConfigStruct.convValue;
	}

	if(wr>=N){
		wr=0;
		dataReady=true;
	}
}

void generalized_cross_correlation_phat(float* x1, float* x2)
{
	arm_float_to_q31(x1, y, N2);
	arm_scale_q31 (y, 0x03FFFFFF, 0, y, NFFT);
	PQ_TransformCFFT(POWERQUAD, N2, y, y);
	PQ_WaitDone(POWERQUAD);
	arm_scale_q31 (y, 0x7FFFFFFF, 7, y, N2);
	arm_q31_to_float(y, g1, N2);

	arm_float_to_q31(x2, y, N2);
	arm_scale_q31 (y, 0x03FFFFFF, 0, y, NFFT);
	PQ_TransformCFFT(POWERQUAD, N2, y, y);
	PQ_WaitDone(POWERQUAD);
	arm_scale_q31 (y, 0x7FFFFFFF, 7, y, N2);
	arm_q31_to_float(y, g2, N2);

	arm_cmplx_conj_f32(g2,g2,N2);
	arm_cmplx_mult_cmplx_f32(g1,g2,g12,N2);
	arm_cmplx_mag_f32(g12,x1,N2);

	for(int i=0;i<N2;i++)
	{
		if(x1[i] < 0.000001)
			x1[i] = 0.000001;

		g12[2*i] /= x1[i];
		g12[2*i+1] /= x1[i];
	}

	arm_cfft_f32(&arm_cfft_sR_f32_len512, g12, 1, 1);
	arm_scale_f32 (g12, 1/256.0, g12, NFFT);

	for(int i=0;i<NFFT;i++)
	{
		g1[i] = g12[counter++];

		if(counter == NFFT)
			counter=0;
	}

	counter=N2;
}

int compare_elements(const void *p, const void *q)
{
	element x = *(const element *)p;
	element y = *(const element *)q;
	return (x.value < y.value) - (x.value > y.value);
}


void drawArrow(int x, int y, int angle, uint16_t color) {
	int length = 64;
	float radAngle = angle * PI / 180.0;
	int x_end = x + length * cos(radAngle);
	int y_end = y + length * sin(radAngle);
	LCD_Draw_Line(x, y, x_end, y_end, color);

	// Lewy koniec strzałki
	int x_left = x_end + 0.5 * length * cos(radAngle + PI * 5 / 6);
	int y_left = y_end + 0.5 * length * sin(radAngle + PI * 5 / 6);
	LCD_Draw_Line(x_end, y_end, x_left, y_left, color);

	//Prawy koniec strzałki
	int x_right = x_end + 0.5 * length * cos(radAngle - PI * 5 / 6);
	int y_right = y_end + 0.5 * length * sin(radAngle - PI * 5 / 6);
	LCD_Draw_Line(x_end, y_end, x_right, y_right, color);
}

/*
 * @brief   Application entry point.
 */
int main(void) {

	/* Disable LDOGPADC power down */
	POWER_DisablePD(kPDRUNCFG_PD_LDOGPADC);

	/* Init board hardware. */
	BOARD_InitBootPins();
	BOARD_InitBootClocks();
	BOARD_InitBootPeripherals();
#ifndef BOARD_INIT_DEBUG_CONSOLE_PERIPHERAL
	/* Init FSL debug console. */
	BOARD_InitDebugConsole();
#endif

	PQ_Init(POWERQUAD);

	pq_config_t pq_cfg;
	pq_cfg.inputAFormat = kPQ_32Bit;
	pq_cfg.inputAPrescale = 0;
	pq_cfg.inputBFormat = kPQ_32Bit;
	pq_cfg.inputBPrescale = 0;
	pq_cfg.tmpFormat = kPQ_32Bit;
	pq_cfg.tmpPrescale = 0;
	pq_cfg.outputFormat = kPQ_32Bit;
	pq_cfg.outputPrescale = 0;
	pq_cfg.tmpBase = (uint32_t *)0xE0000000;
	pq_cfg.machineFormat = kPQ_32Bit;
	PQ_SetConfig(POWERQUAD, &pq_cfg);

	LCD_Init(FLEXCOMM3_PERIPHERAL);
	int x_arrow = LCD_WIDTH / 2; // Początkowa pozycja strzałki (środek ekranu)
	int y_arrow = LCD_HEIGHT / 2; // Początkowa pozycja strzałki (środek ekranu)

	while(1)
	{
		if(dataReady)
		{
			LCD_Clear(0xFFFF);
			for(int i=0;i<N;i++)
			{
				x1[2*i] = (dataBuffer1[i]/32768.0)-1;
				x1[2*i+1] = 0;

				x2[2*i] = (dataBuffer2[i]/32768.0)-1;
				x2[2*i+1] = 0;
			}

			dataReady=false;

			generalized_cross_correlation_phat(x1,x2);

			for(int i=0;i<NFFT;i++)
			{
				sortTab[i].index = i;
				sortTab[i].value = g1[i];
			}

			qsort(sortTab, NFFT, sizeof(sortTab[0]), compare_elements);

			for(int i=0;i<M;i++)
			{
				result = N2-sortTab[i].index + 90;

				drawArrow(x_arrow, y_arrow,result, 0x0000);

			}
			LCD_GramRefresh();
		}

	}
	return 0;
}
