################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../component/uart/fsl_adapter_usart.c 

C_DEPS += \
./component/uart/fsl_adapter_usart.d 

OBJS += \
./component/uart/fsl_adapter_usart.o 


# Each subdirectory must supply rules for building sources it contributes
component/uart/%.o: ../component/uart/%.c component/uart/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DCPU_LPC55S69JBD100_cm33_core0 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DNDEBUG -D__NEWLIB__ -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/drivers" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/LPC55S69/drivers" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/utilities" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/component/uart" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/component/serial_manager" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/component/lists" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/CMSIS" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/device" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/board" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/source" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/drivers" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/LPC55S69/drivers" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/utilities" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/component/uart" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/component/serial_manager" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/component/lists" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/startup" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/CMSIS" -I"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/device" -Os -fno-common -g -gdwarf-4 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-component-2f-uart

clean-component-2f-uart:
	-$(RM) ./component/uart/fsl_adapter_usart.d ./component/uart/fsl_adapter_usart.o

.PHONY: clean-component-2f-uart

