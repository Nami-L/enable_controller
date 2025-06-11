//Verilog HDL for "ASIC_2024", "enable_controller_10_ena" "functional"

module enable_controller (
    input  logic clk_i,
    input  logic reset_i,
    output logic enable1_o,    // Enable en ciclo 0 (1 ciclo)
    output logic enable2_o,    // Enable en ciclo 1 (1 ciclo)
    output logic enable3_o,    // Enable en ciclos 2 y 3 (2 ciclos)
    output logic enable4_o,    // Enable en ciclos 3 (1 ciclo)
	output logic enable5_o,    // Enable en cicolo 4 (1 ciclo)
	output logic enable6_o,    // Enable en cicolo 5 (1 ciclo)
	output logic enable7_o,    // Enable en cicolo 6 (1 ciclo)
	output logic enable8_o,    // Enable en cicolo 7 (1 ciclo)
	output logic enable9_o,    // Enable en cicolo 8 (1 ciclo)
    output logic enable10_o    // Enable en ciclo 9 (1 ciclo)
);

    // Contador de 4 bits (0 a 10)
    logic [3:0] counter;

    always @(posedge clk_i or posedge reset_i) begin
        if (reset_i) begin
            counter <= 4'b0000;
            enable1_o <= 1'b0;
            enable2_o <= 1'b0;
            enable3_o <= 1'b0;	
            enable4_o <= 1'b0;
            enable5_o <= 1'b0;
            enable6_o <= 1'b0;
            enable7_o <= 1'b0;
            enable8_o <= 1'b0;
            enable9_o <= 1'b0;
            enable10_o <= 1'b0;
        end else begin
            // Incrementa el contador clicamente (0  10  0)
            counter <= (counter == 4'b1001) ? 4'b0000 : counter + 1;

            // Lgica de enables
            enable1_o <= (counter == 4'b0000);       // Ciclo 0
            enable2_o <= (counter == 4'b0001);       // Ciclo 1
            enable3_o <= (counter == 4'b0010 //||      // Ciclo 2
                        //counter == 4'b0011 ||
					   //counter == 4'b0100 ||
					   //counter == 4'b0101
);       // Ciclo 3
            enable4_o <= (counter == 4'b0011);       // Ciclo 4	   
            enable5_o <= (counter == 4'b0100);       // Ciclo 5
            enable6_o <= (counter == 4'b0101);       // Ciclo 6
            enable7_o <= (counter == 4'b0110);       // Ciclo 7
            enable8_o <= (counter == 4'b0111);       // Ciclo 8
            enable9_o <= (counter == 4'b1000);       // Ciclo 9	   	   	   	   	   
            enable10_o <= (counter == 4'b1001);      // Ciclo 10
        end
    end

endmodule