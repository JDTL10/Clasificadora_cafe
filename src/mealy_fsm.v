module mealy_fsm (
  input wire sensor_tamano,
  input wire sensor_peso,
  input wire sensor_color,
  output reg [1:0] estado_siguiente
);
  always @(*) begin
    if (!sensor_tamano)
      estado_siguiente = 2'b00; // BAJA
    else if (sensor_tamano && !sensor_peso)
      estado_siguiente = 2'b00;
    else if (sensor_tamano && sensor_peso && !sensor_color)
      estado_siguiente = 2'b01; // MEDIA
    else if (sensor_tamano && sensor_peso && sensor_color)
      estado_siguiente = 2'b10; // ALTA
    else
      estado_siguiente = 2'b00;
  end
endmodule
