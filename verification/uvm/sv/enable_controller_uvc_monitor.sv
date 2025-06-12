`ifndef ENABLE_CONTROLLER_UVC_MONITOR_SV
`define ENABLE_CONTROLLER_UVC_MONITOR_SV

class enable_controller_uvc_monitor extends uvm_monitor;
`uvm_component_utils(enable_controller_uvc_monitor)
uvm_analysis_port #(enable_controller_uvc_sequence_item) analysis_port;

virtual enable_controller_uvc_if vif;
enable_controller_uvc_config m_config;
enable_controller_uvc_sequence_item m_trans;

//VARIABLES TEMPORALES PARA LAS SALIDAS

logic enable1;
logic enable2;
logic enable3;
logic enable4;
logic enable5;
logic enable6;
logic enable7;
logic enable8;
logic enable9;
logic enable10;


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
  do_mon();
endtask : run_phase



task enable_controller_uvc_monitor::do_mon();

  forever begin
    enable1= vif.enable1_o;
    enable2= vif.enable2_o;
    enable3= vif.enable3_o;
    enable4= vif.enable4_o;
    enable5= vif.enable5_o;
    enable6= vif.enable6_o;
    enable7= vif.enable7_o;
    enable8= vif.enable8_o;
    enable9= vif.enable9_o;
    enable10= vif.enable10_o;

    @(vif.cb_mon);
      //LE ASIGNAMOS LO QUE TIENE LA INTERFAZ VIRTUAL AL MONITOR PARA QUE LO LEA

if((enable1 != vif.enable1_o) ||(enable2 != vif.enable2_o) ||(enable3 != vif.enable3_o) ||(enable4 != vif.enable4_o)
 ||(enable5 != vif.enable5_o) ||(enable6 != vif.enable6_o) ||(enable1 != vif.enable1_o) 
 ||(enable7 != vif.enable7_o) ||(enable8 != vif.enable8_o) ||(enable9 != vif.enable9_o) ||
 (enable10 != vif.enable10_o)) begin

    m_trans.m_enable1 = vif.enable1_o;
    m_trans.m_enable2 = vif.enable2_o;
    m_trans.m_enable3 = vif.enable3_o;
    m_trans.m_enable4 = vif.enable4_o;
    m_trans.m_enable5 = vif.enable5_o;
    m_trans.m_enable6 = vif.enable6_o;
    m_trans.m_enable7 = vif.enable7_o;
    m_trans.m_enable8 = vif.enable8_o;
    m_trans.m_enable9 = vif.enable9_o;
    m_trans.m_enable10 = vif.enable10_o;




      `uvm_info(get_type_name(), {"\n ------ MONITOR (Enable_controller UVC) ------ ",
                                  m_trans.convert2string()}, UVM_DEBUG)

      analysis_port.write(m_trans);
   
 end
  end

endtask : do_mon


`endif  //ENABLE_CONTROLLER_UVC_MONITOR_SV
