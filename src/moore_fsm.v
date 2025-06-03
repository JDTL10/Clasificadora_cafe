module moore_fsm (
  input wire clk,
  input wire reset,
  input wire [1:0] estado,
  output reg led_baja,
  output reg led_media,
  output reg led_alta
);
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      led_baja  <= 0;
      led_media <= 0;
      led_alta  <= 0;
    end else begin
      case (estado)
        2'b00: begin
          led_baja  <= 1;
          led_media <= 0;
          led_alta  <= 0;
        end
        2'b01: begin
          led_baja  <= 0;
          led_media <= 1;
          led_alta  <= 0;
        end
        2'b10: begin
          led_baja  <= 0;
          led_media <= 0;
          led_alta  <= 1;
        end
        default: begin
          led_baja  <= 0;
          led_media <= 0;
          led_alta  <= 0;
        end
      endcase
    end
  end
endmodule
