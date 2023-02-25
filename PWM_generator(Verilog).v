//Verilog code for  PWM generator

module PWM (
  input clk, 
  input rst,
  input [7:0] duty,   // 8-bit duty cycle input
  output reg pwm_out,
  output reg cycle
);

  parameter integer cnt_max = 256;   // Maximum counter value
  reg [7:0] cnt;                     // 8-bit counter

  always @(posedge clk) begin
    if (rst) begin
      cnt <= 0;
      pwm_out <= 0;
    end
    else begin
      if (cnt == cnt_max) begin
        cnt <= 0;
        cycle <= 1;      // Output 1 cycle signal on cycle pin
      end
      else begin
        cnt <= cnt + 1;
        cycle <= 0;
      end

      if (cnt < duty) begin  // PWM logic
        pwm_out <= 1;
      end
      else begin
        pwm_out <= 0;
      end
    end
  end
endmodule

