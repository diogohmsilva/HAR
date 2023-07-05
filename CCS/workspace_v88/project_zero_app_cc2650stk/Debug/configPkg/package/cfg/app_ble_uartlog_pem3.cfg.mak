# invoke SourceDir generated makefile for app_ble_uartlog.pem3
app_ble_uartlog.pem3: .libraries,app_ble_uartlog.pem3
.libraries,app_ble_uartlog.pem3: package/cfg/app_ble_uartlog_pem3.xdl
	$(MAKE) -f C:\Users\true_gamer\workspace_v88\project_zero_app_cc2650stk\TOOLS/src/makefile.libs

clean::
	$(MAKE) -f C:\Users\true_gamer\workspace_v88\project_zero_app_cc2650stk\TOOLS/src/makefile.libs clean

