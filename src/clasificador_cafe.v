module clasificador_cafe (
  input wire clk,
  input wire reset,
  input wire sensor_tamano,
  input wire sensor_peso,
  input wire sensor_color,
  output wire led_baja,
  output wire led_media,
  output wire led_alta
);

  wire [1:0] estado;

  // Instancia de la FSM tipo Mealy (combinacional)
  mealy_fsm mealy_inst (
    .sensor_tamano(sensor_tamano),
    .sensor_peso(sensor_peso),
    .sensor_color(sensor_color),
    .estado_siguiente(estado)
  );

  // Instancia de la FSM tipo Moore (secuencial)
  moore_fsm moore_inst (
    .clk(clk),
    .reset(reset),
    .estado(estado),
    .led_baja(led_baja),
    .led_media(led_media),
    .led_alta(led_alta)
  );

endmodule
