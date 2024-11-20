# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "VIDEO_RESOLUTION" -parent ${Page_0}


}

proc update_PARAM_VALUE.VIDEO_RESOLUTION { PARAM_VALUE.VIDEO_RESOLUTION } {
	# Procedure called to update VIDEO_RESOLUTION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VIDEO_RESOLUTION { PARAM_VALUE.VIDEO_RESOLUTION } {
	# Procedure called to validate VIDEO_RESOLUTION
	return true
}


proc update_MODELPARAM_VALUE.VIDEO_RESOLUTION { MODELPARAM_VALUE.VIDEO_RESOLUTION PARAM_VALUE.VIDEO_RESOLUTION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VIDEO_RESOLUTION}] ${MODELPARAM_VALUE.VIDEO_RESOLUTION}
}

