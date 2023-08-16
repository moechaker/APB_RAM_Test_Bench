class transaction;
  
  bit psel;
  bit penable;
  rand bit pwrite;
  bit pready;
  bit pslverr;
  
  rand bit [31:0] paddr;
  rand bit [31:0] pwdata;
  bit [31:0] prdata;
  
  typedef enum int {write = 0, read = 1} op_type;
  
  randc op_type oper;
  
  constraint paddr_c {paddr > 3; paddr <11;}
  constraint pwdata_c {pwdata > 0; pwdata <101;}
  //constraint pwdata_c2 {(oper == 1) -> pwdata==0;}

  
  
  function void display(string tag);
    $display("[%0s] oper = %0s pwrite = %0b paddr = %0d pwdata = %0d prdata = %0d", tag,oper.name,pwrite,paddr,pwdata,prdata);
  endfunction
  
  function transaction copy();
    
    copy = new();
    copy.psel = this.psel;
    copy.penable = this.penable;
    copy.pwrite = this.pwrite;
    copy.pready = this.pready;
    copy.pslverr = this.pslverr;
    copy.paddr = this.paddr;
    copy.pwdata = this.pwdata;
    copy.prdata = this.prdata;
    copy.oper = this.oper;
    
  endfunction
  
endclass