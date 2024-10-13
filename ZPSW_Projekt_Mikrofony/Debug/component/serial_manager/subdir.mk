################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../component/serial_manager/fsl_component_serial_manager.c \
../component/serial_manager/fsl_component_serial_port_uart.c 

C_DEPS += \
./component/serial_manager/fsl_component_serial_manager.d \
./component/serial_manager/fsl_component_serial_port_uart.d 

OBJS += \
./component/serial_manager/fsl_component_serial_manager.o \
./component/serial_manager/fsl_component_serial_port_uart.o 


# Each subdirectory must supply rules for building sources it contributes
component/serial_manager/%.o: ../component/serial_manager/%.c component/serial_manager/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DCPU_LPC55S69JBD100_cm33_core0 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=1 -DPRINTF_FLOAT_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\drivers" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\LPC55S69\drivers" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\utilities" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\uart" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\serial_manager" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\lists" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\CMSIS" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\device" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\board" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\source" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\drivers" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\LPC55S69\drivers" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\utilities" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\uart" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\serial_manager" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\lists" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\startup" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\CMSIS" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\device" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-component-2f-serial_manager

clean-component-2f-serial_manager:
	-$(RM) ./component/serial_manager/fsl_component_serial_manager.d ./component/serial_manager/fsl_component_serial_manager.o ./component/serial_manager/fsl_component_serial_port_uart.d ./component/serial_manager/fsl_component_serial_port_uart.o

.PHONY: clean-component-2f-serial_manager

