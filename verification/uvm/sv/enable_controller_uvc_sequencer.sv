`ifndef ENABLE_CONTROLLER_UVC_SEQUENCER_SV
`define ENABLE_CONTROLLER_UVC_SEQUENCER_SV

class enable_controller_uvc_sequencer extends uvm_sequencer #(enable_controller_uvc_sequence_item);
`uvm_component_utils(enable_controller_uvc_sequencer)

enable_controller_uvc_config m_config;

extern function new(string name, uvm_component parent);
extern function void build_phase(uvm_phase phase);

endclass: enable_controller_uvc_sequencer

function enable_controller_uvc_sequencer::new(string name, uvm_component parent);
super.new(name, parent);
endfunction:new

function void enable_controller_uvc_sequencer::build_phase(uvm_phase phase);
//OBTENEMOS TODO LO QUE TENGA EL CONFIG POR SI SE OCUPA
if(!uvm_config_db#(enable_controller_uvc_config)::get(get_parent(),"","config",m_config))begin
    `uvm_fatal(get_name(), "Could not retrieve enable_controller_uvc_config from config db")

end
endfunction: build_phase

`endif //ENABLE_CONTROLLER_UVC_SEQUENCER_SV