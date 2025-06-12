`ifndef TOP_TEST_VSEQ_SV
`define TOP_TEST_VSEQ_SV

class top_test_vseq extends uvm_sequence;
`uvm_object_utils(top_test_vseq)
`uvm_declare_p_sequencer(top_vsqr)


extern function new (string name ="");
extern task enable_controller_rand_seq();
extern task body();

endclass:top_test_vseq

function top_test_vseq::new(string name = "");
super.new(name);
endfunction:new

task top_test_vseq::enable_controller_rand_seq();
enable_controller_uvc_sequence_base seq;
seq = enable_controller_uvc_sequence_base::type_id::create("seq");

  if (!(seq.randomize() with {
        // m_trans no se declara ni se crea en top_test_vseq, porque ya está declarado y 
        // creado dentro de la clase uvc_sequence_base

        m_trans.m_reset inside {[0:1]};
          

      }))
    `uvm_fatal("RAND_ERROR", "Randomization error!")
  seq.start(p_sequencer.m_enable_controller_sequencer);
endtask: enable_controller_rand_seq



task top_test_vseq::body();

  // Initial delay
  #(30ns);

  repeat (100) begin
    enable_controller_rand_seq();
    //#(10ns);
  end

  // Drain time
  #(106ns);

endtask : body

`endif // TOP_TEST_VSEQ_SV