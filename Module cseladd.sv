module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0]sum1,sum2;
    wire c_sel;
//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
    add16 A1(.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(sum[15:0]), .cout(c_sel) );
    add16 A2(.a(a[31:16]),.b(b[31:16]),.cin(0),.sum(sum1[15:0]), .cout() );
    add16 A3(.a(a[31:16]),.b(b[31:16]),.cin(1),.sum(sum2[15:0]), .cout() );
    always @(c_sel,sum1,sum1) begin
       // assign sum=c_sel?sum[31:16] = sum1:sum[31:16] = sum1;//sum[31:16] = alt_sum1;
        case(c_sel)
            0 : sum[31:16] = sum1;
            1 : sum[31:16] = sum2;
        endcase
    end
    
    
endmodule
