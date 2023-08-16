class monitor;
  transaction trans;
  mailbox #(transaction) mbxms;
  virtual abp_if vif;
  
  
  function new(mailbox #(transaction) mbxms, virtual abp_if vif);
    this.mbxms = mbxms;
    this.vif = vif;
  endfunction
  
  task run();
    trans = new();
  	forever begin
      @(posedge vif.pclk);
      if(vif.psel == 1'b1 && vif.penable == 1'b0) begin
        
        @(posedge vif.pclk);
        
        if(vif.psel && vif.penable && vif.pwrite) begin
          @(posedge vif.pclk);
          trans.pwrite = vif.pwrite;
          trans.paddr = vif.paddr;
          trans.pwdata = vif.pwdata;
          trans.pslverr = vif.pslverr;
          @(posedge vif.pclk);
          trans.display("MON");

        end
        else if (vif.psel && vif.penable && !vif.pwrite) begin
          @(posedge vif.pclk);
          trans.pwrite = vif.pwrite;
          trans.paddr = vif.paddr;
          trans.prdata = vif.prdata;
          trans.pslverr = vif.pslverr;
          @(posedge vif.pclk);
		  trans.display("MON");
        end
        
        mbxms.put(trans);
        
      end

    end
    
    
    
  endtask
  
endclass