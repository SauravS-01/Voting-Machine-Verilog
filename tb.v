`timescale 1ns/1ps
module test;
  
  // Inputs
  reg clock;
  reg reset;
  reg mode;
  reg button1;
  reg button2; 
  reg button3;
  reg button4;
  
  // Outputs 
  wire [7:0] led;
  
  // Instantiate the Unit Under Test (UUT)
  VotingMachine newvm (
    .clock(clock),
    .reset(reset),
    .mode(mode),
    .button1(button1),
    .button2(button2),
    .button3(button3),
    .button4(button4),
    .led(led)
  );
  
  // Clock generation
  initial begin
    clock = 0; 
    forever #5 clock = ~clock;
  end

  // Testbench stimulus
  initial begin
    // Initialize Inputs
    reset = 1;
    mode = 0;
    button1 = 0;
    button2 = 0;
    button3 = 0;
    button4 = 0;
    
    // Wait 100 ns for global reset to finish
    #100;

    // Add stimulus here
    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #200 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 reset = 0; mode = 0; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #200 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0; 
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 reset = 0; mode = 0; button1 = 0; button2 = 1; button3 = 1; button4 = 0;
    #200 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0; 
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #200 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0; 
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
   #5 reset = 0; mode = 1; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #200 reset = 0; mode = 1; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0; 
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #200 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0; 
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    
    $finish;
  end

  // Dump VCD file for simulation waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

  // Monitor and display signals
  initial begin
    $monitor($time, "mode = %b, button1 = %b, button2 = %b, button3 = %b, button4 = %b, led = %d", mode, button1, button2, button3, button4, led);
  end
endmodule

