`ifndef ENABLE_CONTROLLER_UVC_AGENT_SV
`define ENABLE_CONTROLLER_UVC_AGENT_SV

class enable_controller_uvc_agent extends uvm_agent;
  `uvm_component_utils(enable_controller_uvc_agent)

 extern function new(string name, uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

  enable_controller_uvc_monitor m_monitor;
  enable_controller_uvc_driver  m_driver;
  enable_controller_uvc_sequencer m_sequencer;
  enable_controller_uvc_config m_config;

uvm_analysis_port #(enable_controller_uvc_sequence_item) analysis_port;
endclass: enable_controller_uvc_agent


function enable_controller_uvc_agent::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new

function void enable_controller_uvc_agent::build_phase(uvm_phase phase);
//OBTENEMOS LA INFORMACIÖN QUE HAY EN EL CONFIG
if(!uvm_config_db#(enable_controller_uvc_config)::get(this,"","config",m_config))begin
 `uvm_fatal(get_name(),"Could not retrive enable_controller_uvc_config from config db")
 end

//SI EL AGENTE ES ACTIVO ENTONCES DEBEMOS CREAR EL MONITOR, SEQUENCER Y DRIVER
if(m_config.is_active == UVM_ACTIVE) begin
m_sequencer = enable_controller_uvc_sequencer::type_id::create("m_sequencer",this);
m_driver = enable_controller_uvc_driver::type_id::create("m_driver",this);
end 
//INDEPENDIENTEMENTE SI EL AGENTE ES ACTIVO O PASIVO SE TIENE QUE CREAR EL MONITOR
m_monitor= enable_controller_uvc_monitor::type_id::create("m_monitor",this);

//CREAMOS EL ANALYSIS PORT PARA QUE SEA CONECTADO CON EL MONITOR
analysis_port= new("analysis_port",this);
endfunction: build_phase

function void enable_controller_uvc_agent::connect_phase(uvm_phase phase);
//SI EL AGENTE ENTONCES ES ACTIBO, SE CONECTA EL DRIVER CON EL SEQUENCER
//PORQUE EL SEQUENCER LE ENVIA LAS TRANSACTIONES AL DRIVER

if(m_config.is_active == UVM_ACTIVE) begin
m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
end
// CONECTAMOS EL MONTOR CON EL ANALYSIS PORT DEL AGENTE
m_monitor.analysis_port.connect(this.analysis_port);

endfunction: connect_phase



`endif //ENABLE_CONTROLLER_UVC_AGENT_SV