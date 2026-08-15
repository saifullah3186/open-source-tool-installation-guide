`timescale 1ns/1ps

module counter_tb;

    localparam WIDTH = 4;

    reg clk;
    reg rst;
    wire [WIDTH-1:0] count;

    counter #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst = 1'b1;

        #12;
        rst = 1'b0;

        repeat (16) begin
            @(posedge clk);
        end

        if (count !== 4'h0) begin
            $display("FAIL: expected wraparound count 0, got %h", count);
            $finish(1);
        end

        $display("PASS: counter test completed successfully.");
        $finish(0);
    end

endmodule
