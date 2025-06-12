`ifndef ENABLE_CONTROLLER_UVC_SEQUENCE_ITEM_SV
`define ENABLE_CONTROLLER_UVC_SEQUENCE_ITEM_SV

class enable_controller_uvc_sequence_item extends uvm_sequence_item;
`uvm_object_utils(enable_controller_uvc_sequence_item)


//TRANSACTION VARIABLES: INPUTS
rand logic m_reset;
//READ VARIABLES :OUTPUTS
     logic m_enable1;    // Enable en ciclo 0 (1 ciclo)
     logic m_enable2;    // Enable en ciclo 1 (1 ciclo)
     logic m_enable3;    // Enable en ciclos 2 y 3 (2 ciclos)
     logic m_enable4;    // Enable en ciclos 3 (1 ciclo)
	 logic m_enable5;    // Enable en cicolo 4 (1 ciclo)
	 logic m_enable6;    // Enable en cicolo 5 (1 ciclo)
	 logic m_enable7;    // Enable en cicolo 6 (1 ciclo)
	 logic m_enable8;    // Enable en cicolo 7 (1 ciclo)
	 logic m_enable9;    // Enable en cicolo 8 (1 ciclo)
     logic m_enable10;    // Enable en ciclo 9 (1 ciclo)


extern function new(string name ="");
extern function void do_copy(uvm_object rhs);
extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
extern function void do_print(uvm_printer printer);
extern function string convert2string();

endclass: enable_controller_uvc_sequence_item

function enable_controller_uvc_sequence_item::new(string name ="");
super.new(name);
endfunction: new

function void enable_controller_uvc_sequence_item::do_copy(uvm_object rhs);
enable_controller_uvc_sequence_item rhs_;

 if (!$cast(rhs_, rhs)) `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);
        m_reset = rhs_.m_reset;
        m_enable1  =rhs_.m_enable1;
        m_enable2 =rhs_.m_enable2;
        m_enable3 =rhs_.m_enable3;
        m_enable4 =rhs_.m_enable4;
        m_enable5 =rhs_.m_enable5;
        m_enable6 =rhs_.m_enable6;
        m_enable7 =rhs_.m_enable7;
        m_enable8 =rhs_.m_enable8;
        m_enable9 =rhs_.m_enable9;
        m_enable10   =rhs_.m_enable10;

endfunction: do_copy


function bit enable_controller_uvc_sequence_item::do_compare(uvm_object rhs, uvm_comparer comparer);
bit result;
enable_controller_uvc_sequence_item rhs_;
  if (!$cast(rhs_, rhs)) `uvm_fatal(get_type_name(), "Cast of rhs object failed")

result = super.do_compare(rhs, comparer);
result &= (m_reset == rhs_.m_reset);
result &= (m_enable1 == rhs_.m_enable1);
result &= (m_enable2 == rhs_.m_enable2);
result &= (m_enable3 == rhs_.m_enable3);
result &= (m_enable4 == rhs_.m_enable4);
result &= (m_enable5 == rhs_.m_enable5);
result &= (m_enable6 == rhs_.m_enable6);
result &= (m_enable7 == rhs_.m_enable7);
result &= (m_enable8 == rhs_.m_enable8);
result &= (m_enable9 == rhs_.m_enable9);
result &= (m_enable10 == rhs_.m_enable10);

return result;
endfunction: do_compare

function void enable_controller_uvc_sequence_item::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0) `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else printer.m_string = convert2string();
endfunction: do_print



function string enable_controller_uvc_sequence_item::convert2string();

  string s;
  s = super.convert2string();
  $sformat(s, {s, "\n", "TRANSACTION INFORMATION (Enable Controller UVC):"});
  $sformat(s, {s, "\n", "m_enable1 = %5d, m_enable2= %5d, m_enable3 = %5d, m_enable4 = %5d, m_enable5 = %5d, m_enable7 = %5d, m_enable8 = %5d, m_enable9 = %5d, m_enable10 = %5d, m_reset = %5d\n"},
            m_enable1, m_enable2, m_enable3, m_enable4, m_enable5, m_enable6, m_enable7, m_enable8, m_enable9, m_enable10, m_reset);
  return s;

endfunction: convert2string


`endif //ENABLE_CONTROLLER_UVC_SEQUENCE_ITEM_SV