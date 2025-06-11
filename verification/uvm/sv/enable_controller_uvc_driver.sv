`ifndef ENABLE_CONTROLLER_UVC_DRIVER_SV
`define ENABLE_CONTROLLER_UVC_DRIVER_SV

class enable_controller_uvc_driver extends uvm_driver #(enable_controller_uvc_sequence_item);
`uvm_component_utils(enable_controller_uvc_driver)

virtual enable_controller_uvc_if vif;
enable_controller_uvc_config m_config;

extern function new(string name,uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern task do_drive();
endclass: enable_controller_uvc_driver

function enable_controller_uvc_driver:: new(string name, uvm_component parent);
super.new(name,parent);
endfunction: new

function void enable_controller_uvc_driver:: build_phase(uvm_phase phase);

//EN EL BUILD VAMOS A OBTENER LAS SEÑALES DEL DUT A TRAVES DE UN HANDLE Y TAMBIEN DEL CONFIG
// POR SI EN UN MOMENTO SE OCUPA
 if (!uvm_config_db#(virtual enable_controller_uvc_if)::get(get_parent(), "", "vif", vif)) begin
    `uvm_fatal(get_name(), "Could not retrieve enable_controller_uvc_if from VIF db")
  end

if (!uvm_config_db#(enable_controller_uvc_config)::get(get_parent(), "", "config", m_config)) begin
    `uvm_fatal(get_name(), "Could not retrieve enable_controller_uvc_config from config db")
  end

endfunction: build_phase

task enable_controller_uvc_driver::run_phase(uvm_phase phase);
forever begin
//PIDE LA TRANSACTION AL SEQUENCER QUE YA GENERO EL SEQUENCE
seq_item_port.get_next_item(req);
//LAS SEÑALES QUE SE HAN OBTENIDO SE VAN AL DO_DRIVE
do_drive();
//YA QUE TERMINO LA TAREA, LE DICE AL SEQUENCER QUE 
//FINALIZO
seq_item_port.item_done();
end
endtask: run_phase

task enable_controller_uvc_driver::do_drive();

 // `uvm_info(get_type_name(), {"\n ------ DRIVER (Enable Controller UVC) ------", req.convert2string()}, UVM_DEBUG)

endtask: do_drive


`endif //ENABLE_CONTROLLER_UVC_DRIVER_SV