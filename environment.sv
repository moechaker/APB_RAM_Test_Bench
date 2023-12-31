class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sco;
  
  mailbox #(transaction) mbxgd,mbxms;
  
  event done,drvnext,sconext;
  
  function new(virtual abp_if vif);
    mbxgd = new();
    mbxms = new();
    
    gen = new(mbxgd,done,drvnext,sconext);
    drv = new(mbxgd, drvnext, vif);
    mon = new(mbxms, vif);
    sco = new(mbxms, sconext);
  endfunction
  
  task pre_test();
    drv.reset();
  endtask
  
  task test();
    fork
      gen.run();
      drv.run();
      mon.run();
      sco.run();
    join_any
    
  endtask
  
  task post_test();
    wait(gen.done.triggered);
    $finish;
  endtask
  
  
  task run();
    pre_test();
    test();
    post_test();
  endtask
  
  
  
endclass