module trans_form_tb  ; 

parameter N  = 8 ; 
  reg  [N-1:0]  x   ; 
  wire  [N-1:0]  y   ; 
  reg    rst   ; 
  reg    clk   ; 
  trans_form    #( N  )
   DUT  ( 
       .x (x ) ,
      .y (y ) ,
      .rst (rst ) ,
      .clk (clk ) ); 

parameter T_period = 10;
integer i,error_count,correct_count;

reg [N-1:0] mem [0:99];
reg [N-1:0] mem_out [0:99];
initial
  begin
    clk=0;
    error_count=0;
    correct_count=0;
    forever #(T_period/2) clk = ~clk;
  end

initial
  begin
        $readmemh("input1.txt",mem);
        $readmemh("output1.txt",mem_out);
  end

initial
  begin
    rst=0;
    @(negedge clk)
    rst=1;
    for(i=0;i<100;i=i+1)
      begin
        x=mem[i];
        @(negedge clk);
        if(y!=mem_out[i])
          begin
            $display("error %0t",$time);
            error_count = error_count +1;
          end
        else
          correct_count=correct_count+1;
      end
    $display("Test Cases Passed: %0d, Test Cases Failed: %0d",correct_count,error_count);
    $stop;
  end







endmodule

