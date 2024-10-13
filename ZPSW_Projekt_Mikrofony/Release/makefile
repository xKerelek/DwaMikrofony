################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include utilities/subdir.mk
-include startup/subdir.mk
-include source/subdir.mk
-include drivers/subdir.mk
-include device/subdir.mk
-include component/uart/subdir.mk
-include component/serial_manager/subdir.mk
-include component/lists/subdir.mk
-include board/subdir.mk
-include LPC55S69/drivers/subdir.mk
ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := sound_locator
BUILD_ARTIFACT_EXTENSION := axf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all:
	+@$(MAKE) --no-print-directory main-build && $(MAKE) --no-print-directory post-build

# Main-build Target
main-build: sound_locator.axf

# Tool invocations
sound_locator.axf: $(OBJS) $(USER_OBJS) makefile $(OPTIONAL_TOOL_DEPS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -L"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/LPC55S69/mcuxpresso" -L"/Users/ki_14/Documents/MCUXpressoIDE_11.9.0_2144/workspace/sound_locator/libs" -Xlinker -Map="sound_locator.map" -Xlinker --gc-sections -Xlinker -print-memory-usage -Xlinker --sort-section=alignment -Xlinker --cref -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -T sound_locator_Release.ld -o "sound_locator.axf" $(OBJS) $(USER_OBJS) $(LIBS) -lpower_hardabi -larm_ARMv8MMLldfsp_math
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) sound_locator.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size "sound_locator.axf"; # arm-none-eabi-objcopy -v -O binary "sound_locator.axf" "sound_locator.bin" ; # checksum -p LPC55S69 -d "sound_locator.bin";
	-@echo ' '

.PHONY: all clean dependents main-build post-build

-include ../makefile.targets
