`ifndef TOP_ENV_SV
`define TOP_ENV_SV

class top_env extends uvm_env;

`uvm_component_utils(top_env)
enable_controller_uvc_agent m_enable_controller_agent;
enable_controller_uvc_config m_enable_controller_config;

extern function new(string name, uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass: top_env


function top_env :: new(string name, uvm_component parent);
super.new(name, parent);
endfunction: new

function void top_env::build_phase(uvm_phase phase);

//CREAMOS EL AGENTE
m_enable_controller_agent= enable_controller_uvc_agent::type_id::create("m_enable_controller_agent",this);

//CREAMOS EL CONFIG
m_enable_controller_config = enable_controller_uvc_config::type_id::create("m_enable_controller_config");
m_enable_controller_config.is_active = UVM_ACTIVE;
uvm_config_db#(enable_controller_uvc_config)::set(this,"m_enable_controller_agent*","config",m_enable_controller_config);


endfunction: build_phase

function void top_env::connect_phase(uvm_phase phase);
endfunction: connect_phase


`endif //TOP_ENV_SV