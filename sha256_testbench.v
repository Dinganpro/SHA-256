module sha256_testbench;

    reg clk, reset;
    reg [7:0] data_in;
    reg data_valid, last_byte;
    wire [255:0] hash_out;
    wire hash_valid, ready;

    // Clock generation
    always #5 clk = ~clk;

    // Instantiate DUT
    sha256_top dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_valid(data_valid),
        .last_byte(last_byte),
        .hash_out(hash_out),
        .hash_valid(hash_valid),
        .ready(ready)
    );

    // Test stimulus
    initial begin
        clk = 0;
        reset = 1;
        data_valid = 0;
        last_byte = 0;

        #20 reset = 0;

        // Test 1: Empty message
        #10 last_byte = 1; data_valid = 1;
        #10 data_valid = 0; last_byte = 0;
        wait(ready);

        // Test 2: "abc" input
        #10 data_in = 8'h61; data_valid = 1; // 'a'
        #10 data_in = 8'h62;                // 'b'
        #10 data_in = 8'h63; last_byte = 1; // 'c'
        #10 data_valid = 0; last_byte = 0;

        wait(hash_valid);
        $display("Hash Output: %h", hash_out);
        $finish;
    end

endmodule