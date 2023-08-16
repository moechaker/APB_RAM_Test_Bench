class driver;
  transaction trans;
  
  mailbox #(transaction) mbxgd;
  event drvnext;
  virtual abp_if vif;
  
  function new(mailbox #(transaction) mbxgd, event drvnext, virtual abp_if vif);
    this.mbxgd = mbxgd;
    this.drvnext = drvnext;
    this.vif = vif;
  endfunction
  
  task reset();
    vif.presetn <= 1'b0;
    @(posedge vif.pclk);
    vif.presetn <= 1'b1;
    $display("RESET DONE!");
  endtask
  
  task run();
    forever begin
      mbxgd.get(trans);
      
      //$display("I'm here!");
      //$display("trans.oper = %0d",trans.oper);
      if(trans.oper == 0) begin 
        @(posedge vif.pclk);
        vif.psel <= 1'b1;
        vif.penable <= 1'b0;
        vif.pwdata <= trans.pwdata;
        vif.paddr <= trans.paddr;
        vif.pwrite <= 1'b1;
        @(posedge vif.pclk);
        vif.penable <= 1'b1;
        repeat(2) @(posedge vif.pclk);
        vif.psel <= 1'b0;
        vif.penable <= 1'b0;
        vif.pwrite <= 1'b0;
        trans.display("DRV");
      end
      else if(trans.oper == 1) begin
        //$display("I'm here!");
        @(posedge vif.pclk);
        //$display("I'm here into the clock");
        vif.psel <= 1'b1;
        vif.penable <= 1'b0;
        vif.pwdata <= trans.pwdata;
        vif.paddr <= trans.paddr;
        vif.pwrite <= 1'b0;
        @(posedge vif.pclk);
        vif.penable <= 1'b1;
        repeat(2)  @(posedge vif.pclk);
        vif.psel <= 1'b0;
        vif.penable <= 1'b0;
        vif.pwrite <= 1'b0;
        trans.display("DRV");
      end
      else if(trans.oper == 2) begin
        @(posedge vif.pclk);
        vif.psel <= 1'b1;
        vif.penable <= 1'b0;
        vif.paddr <= $urandom_range(32,100);
        vif.pwdata <= trans.pwdata;
        @(posedge vif.pclk);
        vif.pwrite <= $urandom();
        vif.penable <= 1; 
        repeat(2) @(posedge vif.pclk); 
        vif.psel <= 1'b0;
        vif.penable <= 1'b0;
        vif.pwrite <= 1'b0;
        $display("[DRV] : SLV ERROR");
      end
      
      ->drvnext;
      
    end
    
  endtask
  
  
  
  
  
  
  
endclass