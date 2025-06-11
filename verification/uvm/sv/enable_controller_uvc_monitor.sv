`ifndef ENABLE_CONTROLLER_UVC_MONITOR_SV
`define ENABLE_CONTROLLER_UVC_MONITOR_SV

class enable_controller_uvc_monitor extends uvm_monitor;
`uvm_component_utils(enable_controller_uvc_monitor)
uvm_analysis_port #(enable_controller_uvc_sequence_item) analysis_port;

virtual enable_controller_uvc_if vif;
enable_controller_uvc_config m_config;
enable_controller_uvc_sequence_item m_trans;

  extern function new(string name, uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task do_mon();

endclass: enable_controller_uvc_monitor

function enable_controller_uvc_monitor::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new

function void enable_controller_uvc_monitor::build_phase(uvm_phase phase);
  //EN ESTA PARTE, AL IGUAL QUE EL DRIVER, SE NECESITA TENER ACCESO
  //A LA INTERFAZ VIRTUAL
  // AGREGAMOS EL CONFIG POR SI SE OCUPA
  if (!uvm_config_db#(virtual enable_controller_uvc_if)::get(get_parent(), "", "vif", vif)) begin
    `uvm_fatal(get_name(), "Could not retrieve enable_controller_uvc_if from VIF db")
  end

  if (!uvm_config_db#(enable_controller_uvc_config)::get(get_parent(), "", "config", m_config)) begin
    `uvm_fatal(get_name(), "Could not retrieve enable_controller_uvc_config from config db")
  end

  analysis_port = new("analysis_port", this);

endfunction : build_phase


task enable_controller_uvc_monitor::run_phase(uvm_phase phase);
  // CREAMOS EL OBJETO PORQUE AHORA NECESITAMOS LEER LO QUE TIENE 
  //EL DUT A TRAVES DE LA INTERFAZ
  m_trans = enable_controller_uvc_sequence_item::type_id::create("m_trans");
  //do_mon();
endtask : run_phase



task enable_controller_uvc_monitor::do_mon();

  forever begin


      `uvm_info(get_type_name(), {"\n ------ MONITOR (Enable_controller UVC) ------ ",
                                  m_trans.convert2string()}, UVM_DEBUG)

      analysis_port.write(m_trans);
   

  end

endtask : do_mon


`endif  //ENABLE_CONTROLLER_UVC_MONITOR_SV
