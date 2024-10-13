################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../utilities/fsl_debug_console.c \
../utilities/fsl_str.c 

C_DEPS += \
./utilities/fsl_debug_console.d \
./utilities/fsl_str.d 

OBJS += \
./utilities/fsl_debug_console.o \
./utilities/fsl_str.o 


# Each subdirectory must supply rules for building sources it contributes
utilities/%.o: ../utilities/%.c utilities/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DCPU_LPC55S69JBD100_cm33_core0 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=1 -DPRINTF_FLOAT_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\drivers" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\LPC55S69\drivers" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\utilities" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\uart" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\serial_manager" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\lists" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\CMSIS" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\device" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\board" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\source" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\drivers" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\LPC55S69\drivers" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\utilities" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\uart" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\serial_manager" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\component\lists" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\startup" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\CMSIS" -I"D:\Programowanie\MCUXpresso\ZPSW_Projekt_Mikrofony\device" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-utilities

clean-utilities:
	-$(RM) ./utilities/fsl_debug_console.d ./utilities/fsl_debug_console.o ./utilities/fsl_str.d ./utilities/fsl_str.o

.PHONY: clean-utilities

