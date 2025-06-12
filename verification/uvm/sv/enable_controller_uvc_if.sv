`ifndef ENABLE_CONTROLLER_UVC_IF_SV
`define ENABLE_CONTROLLER_UVC_IF_SV

interface enable_controller_uvc_if 
(input logic clk_i);
//input logic reset_i);

    logic reset_i;
     logic enable1_o;    // Enable en ciclo 0 (1 ciclo)
     logic enable2_o;    // Enable en ciclo 1 (1 ciclo)
     logic enable3_o;    // Enable en ciclos 2 y 3 (2 ciclos)
     logic enable4_o;    // Enable en ciclos 3 (1 ciclo)
	 logic enable5_o;    // Enable en cicolo 4 (1 ciclo)
	 logic enable6_o;    // Enable en cicolo 5 (1 ciclo)
	 logic enable7_o;    // Enable en cicolo 6 (1 ciclo)
	 logic enable8_o;    // Enable en cicolo 7 (1 ciclo)
	 logic enable9_o;    // Enable en cicolo 8 (1 ciclo)
     logic enable10_o;    // Enable en ciclo 9 (1 ciclo)



//valores por defecto


//                                [interface dut_if]
//     +--------+         writes         +-------+         reads         +----------+
//     | Driver | ---------------------> | DUT   | --------------------> | Monitor  |
//     +--------+   rst, data_in         +-------+     data_out          +----------+


//EL DRIVER CONTROLA ESTAS SEÑALES, POR LO TANTO ESAS SEÑALES
//SON SALIDS DEL DRIVER QUE ENTRAS AL DUT
clocking cb_drv @(posedge clk_i);
    default input #1ns output #1ns;
     output reset_i;
endclocking: cb_drv

//EL MONITOR LEE LO QUE TENGA LA SALIDA DEL DUT, POR LO TANTO
//ES UNA ENTRADA
clocking cb_mon @(posedge clk_i);
    default input #1ns output #1ns;
    
     input enable1_o;    // Enable en ciclo 0 (1 ciclo)
     input enable2_o;    // Enable en ciclo 1 (1 ciclo)
     input enable3_o;    // Enable en ciclos 2 y 3 (2 ciclos)
     input enable4_o;    // Enable en ciclos 3 (1 ciclo)
	 input enable5_o;    // Enable en cicolo 4 (1 ciclo)
	 input enable6_o;    // Enable en cicolo 5 (1 ciclo)
	 input enable7_o;    // Enable en cicolo 6 (1 ciclo)
	 input enable8_o;    // Enable en cicolo 7 (1 ciclo)
	 input enable9_o;    // Enable en cicolo 8 (1 ciclo)
     input enable10_o;    // Enable en ciclo 9 (1 ciclo)

endclocking: cb_mon


endinterface: enable_controller_uvc_if

`endif // ENABLE_CONTROLLER_UVC_IF_SV
