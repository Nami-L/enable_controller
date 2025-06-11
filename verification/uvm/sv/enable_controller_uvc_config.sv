`ifndef ENABLE_CONTROLLER_UVC_CONFIG_SV
`define ENABLE_CONTROLLER_UVC_CONFIG_SV

class enable_controller_uvc_config extends uvm_object;
`uvm_object_utils(enable_controller_uvc_config)

uvm_active_passive_enum is_active= UVM_ACTIVE;

extern function new(string name ="");

endclass: enable_controller_uvc_config



function enable_controller_uvc_config::new(string name ="");
super.new(name);
endfunction: new


`endif //ENABLE_CONTROLLER_UVC_CONFIG_SV