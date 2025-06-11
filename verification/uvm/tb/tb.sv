module tb;
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import top_test_pkg::*;
  //GENERAMOS LA SEÑAL DE CONTROL
  localparam time CLK_PERIOD = 10ns;
  logic clk_i = 0;
  always #(CLK_PERIOD / 2) clk_i = ~clk_i;

  //GENERAMOS EL RESET

  logic reset_i = 1;
  initial begin
    repeat (2) @(posedge clk_i) reset_i = 1;
    @(posedge clk_i) reset_i = 0;
  end

  //COLOCAR LA INTERFAZ
  enable_controller_uvc_if enable_controller_vif(clk_i,reset_i);

  //INSTANCIAR EL DUT CON LA INTERFAZ

  enable_controller dut (
      .clk_i(enable_controller_vif.clk_i),
      .reset_i(enable_controller_vif.reset_i),
      .enable1_o(enable_controller_vif.enable1_o),  // Enable en ciclo 0 (1 ciclo)
      .enable2_o(enable_controller_vif.enable2_o),  // Enable en ciclo 1 (1 ciclo)
      .enable3_o(enable_controller_vif.enable3_o),  // Enable en ciclos 2 y 3 (2 ciclos)
      .enable4_o(enable_controller_vif.enable4_o),  // Enable en ciclos 3 (1 ciclo)
      .enable5_o(enable_controller_vif.enable5_o),  // Enable en cicolo 4 (1 ciclo)
      .enable6_o(enable_controller_vif.enable6_o),  // Enable en cicolo 5 (1 ciclo)
      .enable7_o(enable_controller_vif.enable7_o),  // Enable en cicolo 6 (1 ciclo)
      .enable8_o(enable_controller_vif.enable8_o),  // Enable en cicolo 7 (1 ciclo)
      .enable9_o(enable_controller_vif.enable9_o),  // Enable en cicolo 8 (1 ciclo)
      .enable10_o(enable_controller_vif.enable10_o)  // Enable en ciclo 9 (1 ciclo)
  );


  initial begin
    $timeformat(-9, 0, " ns", 10);
    uvm_config_db#(virtual enable_controller_uvc_if)::set(null, "uvm_test_top.m_env.m_enable_controller_agent", "vif",
                                              enable_controller_vif);
    run_test();
  end

endmodule : tb
