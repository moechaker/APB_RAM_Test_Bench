class scoreboard;
  transaction trans;
  mailbox #(transaction) mbxms;
  mailbox #(transaction) mbxds;
  event sconext;
  
  bit [31:0] temp_mem [32];
  
  function new(mailbox #(transaction) mbxms, event sconext);
    this.mbxms = mbxms;
    this.sconext = sconext;
  endfunction
  
  task run();
    forever begin
      mbxms.get(trans);
      trans.display("SCO");
	  $display("=================================");
      //write
      if(trans.pwrite && !trans.pslverr)
        temp_mem[trans.paddr] = trans.pwdata;
      //read
      else if (!trans.pwrite && !trans.pslverr) begin
        if(trans.prdata == temp_mem[trans.paddr])
          begin
           $display("data matched");
            $display("=================================");
          end
        else
          begin
          $display("data MISMATCH");
            $display("=================================");
          end
        
      end
      else if (trans.pslverr)
        $display("SLV ERROR DETECTED!");
      ->sconext;
        
    end
    
  endtask
  
  
  
endclass