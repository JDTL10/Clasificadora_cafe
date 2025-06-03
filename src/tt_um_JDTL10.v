module tt_um_JDTL10 (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire       clk,
    input  wire       rst_n,
    input  wire       ena,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe
);

    // Mapear señales desde ui_in
    wire sensor_tamano = ui_in[0];
    wire sensor_peso   = ui_in[1];
    wire sensor_color  = ui_in[2];

    wire reset = ~rst_n;  // Convertimos reset a activo alto

    // Salidas
    wire led_baja, led_media, led_alta;

    // Instancia del clasificador
    clasificador_cafe clasif (
        .clk(clk),
        .reset(reset),
        .sensor_tamano(sensor_tamano),
        .sensor_peso(sensor_peso),
        .sensor_color(sensor_color),
        .led_baja(led_baja),
        .led_media(led_media),
        .led_alta(led_alta)
    );

    assign uo_out[0] = led_baja;
    assign uo_out[1] = led_media;
    assign uo_out[2] = led_alta;
    assign uo_out[7:3] = 5'b00000;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule

