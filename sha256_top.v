module sha256_top (
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    input wire data_valid,
    input wire last_byte,
    output wire [255:0] hash_out,
    output wire hash_valid,
    output wire ready
);

    // Internal signals
    wire [511:0] preprocessed_block;
    wire block_ready;
    wire core_start;
    wire core_ready;

    // Instantiate preprocessing module
    sha256_preprocessing preprocess_inst (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_valid(data_valid),
        .last_byte(last_byte),
        .block_out(preprocessed_block),
        .block_ready(block_ready)
    );

    // Instantiate core hash module
    sha256_core core_inst (
        .clk(clk),
        .reset(reset),
        .start(core_start),
        .block_in(preprocessed_block),
        .hash_out(hash_out),
        .hash_valid(hash_valid),
        .ready(core_ready)
    );

    // Control logic
    assign core_start = block_ready && core_ready;
    assign ready = core_ready && !block_ready;

endmodule