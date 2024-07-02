module tb_RAM;

    // Constants
    localparam CLK_PERIOD = 10; // Clock period in ns
    
    // Signals
    logic clk;
    logic reset;
    logic [4:0] address;
    logic [7:0] data_in;
    logic write_enb;
    logic read_enb;
    logic [7:0] data_out;

    // Instantiate RAM module
    RAM dut (
        .clk(clk),
        .reset(reset),
        .address(address),
        .data_in(data_in),
        .write_enb(write_enb),
        .read_enb(read_enb),
        .data_out(data_out)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Initial stimulus
    initial begin
        clk = 0;
        reset = 0;
        address = 5'b00000; // Initial address
        data_in = 8'b00000000;
        write_enb = 0;
        read_enb = 0;

        // Reset
        #11;
        reset = 1;
      

        // Write and read operations
#4
        // Write data 1 to address 100
        address = 5'b11001; // Decimal 25, binary 11001 (for address 100)
      
        data_in = 8'b00000001;
        write_enb = 1;
        read_enb = 0;
      #5 write_enb =0;
      
        #15;
        write_enb = 0;
        read_enb = 1;

        
      #10  $finish;
    end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
