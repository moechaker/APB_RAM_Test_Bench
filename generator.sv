class generator;
  
  transaction trans;
  
  mailbox #(transaction) mbxgd;
  
  int count;
  
  event done,drvnext,sconext;
  
  function new(mailbox #(transaction) mbxgd, event done,event drvnext,event sconext);
    this.mbxgd = mbxgd;
    this.count = count;
    this.done = done;
    this.drvnext = drvnext;
    this.sconext = sconext;
    trans = new();
  endfunction
  
  task run();
    
    repeat(count) begin
      assert(trans.randomize()) else $error("Randomization Failed");
      mbxgd.put(trans.copy);
      trans.display("GEN");
      @(drvnext);
      @(sconext);
    
    end
    
    -> done;
    
  endtask
  
  
endclass