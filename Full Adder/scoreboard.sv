class scoreboard;
  
  transaction tr;
  mailbox montoscr;
  event my_event;
  
  function new(mailbox kkr);
    this.montoscr=kkr;
  endfunction
  
  task main();
    tr=new();
    repeat(10)
    	begin
          
          montoscr.get(tr);
          tr.display("Scoreboard Class Signals");
          
          if(((tr.a^tr.b^tr.c)==tr.sum)&&(((tr.a&tr.b)|(tr.b&tr.c)|(tr.c&tr.a))==tr.carry))
            
            begin
              $display("*****************************************");
              $display("                PASSED");
          	  $display("*****************************************");
            end
        else
            begin
              $display("*****************************************");
              $display("                FAILED");
              $display("*****************************************");
            end
          
          #1;
          -> my_event;
        end
  endtask
  
endclass
