`ifndef ENABLE_CONTROLLER_UVC_SEQUENCE_BASE_SV 
`define ENABLE_CONTROLLER_UVC_SEQUENCE_BASE_SV

class enable_controller_uvc_sequence_base extends uvm_sequence #(enable_controller_uvc_sequence_item);

`uvm_object_utils(enable_controller_uvc_sequence_base)
rand enable_controller_uvc_sequence_item m_trans;

extern function new(string name = "");
extern virtual task body();

endclass: enable_controller_uvc_sequence_base

function enable_controller_uvc_sequence_base::new(string name ="");
super.new(name);
m_trans = enable_controller_uvc_sequence_item::type_id::create("m_trans");

endfunction:new

task enable_controller_uvc_sequence_base::body();
  start_item(m_trans);
  finish_item(m_trans);
endtask:body

`endif //ENABLE_CONTROLLER_UVC_SEQUENCE_BASE_SV