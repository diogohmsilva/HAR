################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
ICall/icall.obj: C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/icall/src/icall.c $(GEN_OPTS) | $(GEN_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti_ccs8/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/bin/armcl" --cmd_file="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/examples/cc2650stk/sensortag/ccs/app/../../../../../src/config/build_components.opt" --cmd_file="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/examples/cc2650stk/sensortag/ccs/app/../stack/build_config.opt" --cmd_file="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/examples/cc2650stk/sensortag/ccs/app/../config/ccs_compiler_defines.bcfg"  -mv7M3 --code_state=16 --abi=eabi -me -O4 --opt_for_speed=0 --include_path="C:/ti_ccs8/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/examples/sensortag/cc26xx/app" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/controller/cc26xx/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/rom" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/common/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/icall/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/batt/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/dev_info" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/hid_dev/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/keys" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/oad/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/roles" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/roles/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/sensor_profile/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/heapmgr" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/hal/src/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/hal/src/target/_common/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/hal/src/target/_common" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/target" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/icall/src" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/icall/src/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/osal/src/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/services/src/saddr" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/services/src/sdata" --include_path="C:/ti/tirtos_cc13xx_cc26xx_2_20_01_08/products/cc26xxware_2_24_02_17393" --include_path="C:/ti/tirtos_cc13xx_cc26xx_2_20_01_08/products/tidrivers_cc13xx_cc26xx_2_20_01_10/packages" --include_path="C:/ti/tirtos_cc13xx_cc26xx_2_20_01_08/products/tidrivers_cc13xx_cc26xx_2_20_01_10/packages/ti/mw/extflash" --include_path="C:/ti/tirtos_cc13xx_cc26xx_2_20_01_08/products/tidrivers_cc13xx_cc26xx_2_20_01_10/packages/ti/mw/sensors" --include_path="C:/ti/tirtos_cc13xx_cc26xx_2_20_01_08/products/tidrivers_cc13xx_cc26xx_2_20_01_10/packages/ti/mw/sensortag" --c99 --define=CC2650STK --define=CC26XX --define=Display_DISABLE_ALL --define=EXCLUDE_AUDIO --define=FACTORY_IMAGE --define=FEATURE_OAD --define=GATT_TI_UUID_128_BIT --define=HEAPMGR_SIZE=0 --define=ICALL_MAX_NUM_ENTITIES=11 --define=ICALL_MAX_NUM_TASKS=8 --define=POWER_SAVING --define=USE_ICALL --define=xdc_runtime_Assert_DISABLE_ALL --define=xdc_runtime_Log_DISABLE_ALL --diag_warning=225 --diag_suppress=48 --diag_wrap=off --display_error_number --gen_func_subsections=on --preproc_with_compile --preproc_dependency="ICall/$(basename $(<F)).d_raw" --obj_directory="ICall" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

ICall/icall_cc2650.obj: C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/icall/src/icall_cc2650.c $(GEN_OPTS) | $(GEN_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti_ccs8/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/bin/armcl" --cmd_file="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/examples/cc2650stk/sensortag/ccs/app/../../../../../src/config/build_components.opt" --cmd_file="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/examples/cc2650stk/sensortag/ccs/app/../stack/build_config.opt" --cmd_file="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/examples/cc2650stk/sensortag/ccs/app/../config/ccs_compiler_defines.bcfg"  -mv7M3 --code_state=16 --abi=eabi -me -O4 --opt_for_speed=0 --include_path="C:/ti_ccs8/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/examples/sensortag/cc26xx/app" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/controller/cc26xx/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/rom" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/common/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/icall/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/batt/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/dev_info" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/hid_dev/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/keys" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/oad/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/roles" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/roles/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/profiles/sensor_profile/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/heapmgr" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/hal/src/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/hal/src/target/_common/cc26xx" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/hal/src/target/_common" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/target" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/icall/src" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/icall/src/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/osal/src/inc" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/services/src/saddr" --include_path="C:/ti_ccs8/simplelink/ble_sdk_2_02_01_18/src/components/services/src/sdata" --include_path="C:/ti/tirtos_cc13xx_cc26xx_2_20_01_08/products/cc26xxware_2_24_02_17393" --include_path="C:/ti/tirtos_cc13xx_cc26xx_2_20_01_08/products/tidrivers_cc13xx_cc26xx_2_20_01_10/packages" --include_path="C:/ti/tirtos_cc13xx_cc26xx_2_20_01_08/products/tidrivers_cc13xx_cc26xx_2_20_01_10/packages/ti/mw/extflash" --include_path="C:/ti/tirtos_cc13xx_cc26xx_2_20_01_08/products/tidrivers_cc13xx_cc26xx_2_20_01_10/packages/ti/mw/sensors" --include_path="C:/ti/tirtos_cc13xx_cc26xx_2_20_01_08/products/tidrivers_cc13xx_cc26xx_2_20_01_10/packages/ti/mw/sensortag" --c99 --define=CC2650STK --define=CC26XX --define=Display_DISABLE_ALL --define=EXCLUDE_AUDIO --define=FACTORY_IMAGE --define=FEATURE_OAD --define=GATT_TI_UUID_128_BIT --define=HEAPMGR_SIZE=0 --define=ICALL_MAX_NUM_ENTITIES=11 --define=ICALL_MAX_NUM_TASKS=8 --define=POWER_SAVING --define=USE_ICALL --define=xdc_runtime_Assert_DISABLE_ALL --define=xdc_runtime_Log_DISABLE_ALL --diag_warning=225 --diag_suppress=48 --diag_wrap=off --display_error_number --gen_func_subsections=on --preproc_with_compile --preproc_dependency="ICall/$(basename $(<F)).d_raw" --obj_directory="ICall" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


