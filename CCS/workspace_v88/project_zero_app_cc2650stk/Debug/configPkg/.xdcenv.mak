#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/ti_ccs8/tirtos_cc13xx_cc26xx_2_20_01_08/packages;C:/ti_ccs8/tirtos_cc13xx_cc26xx_2_20_01_08/products/tidrivers_cc13xx_cc26xx_2_20_01_10/packages;C:/ti_ccs8/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages;C:/ti_ccs8/tirtos_cc13xx_cc26xx_2_20_01_08/products/uia_2_00_06_52/packages
override XDCROOT = C:/ti_ccs8/xdctools_3_32_00_06_core
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/ti_ccs8/tirtos_cc13xx_cc26xx_2_20_01_08/packages;C:/ti_ccs8/tirtos_cc13xx_cc26xx_2_20_01_08/products/tidrivers_cc13xx_cc26xx_2_20_01_10/packages;C:/ti_ccs8/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages;C:/ti_ccs8/tirtos_cc13xx_cc26xx_2_20_01_08/products/uia_2_00_06_52/packages;C:/ti_ccs8/xdctools_3_32_00_06_core/packages;..
HOSTOS = Windows
endif
