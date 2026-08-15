`timescale 1ns/1ps

module uart_tb;

    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0] tx_data;
    wire tx;
    wire busy;

    uart_tx #(.CLKS_PER_BIT(4)) dut (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .busy(busy)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        tx_start = 0;
        tx_data = 8'hA5;

        #12;
        rst = 0;

        @(posedge clk);
        tx_start <= 1'b1;
        @(posedge clk);
        tx_start <= 1'b0;

        wait (busy == 1'b1);
        wait (busy == 1'b0);

        $display("PASS: UART transmitter completed transmission.");
        $finish;
    end

endmodule
