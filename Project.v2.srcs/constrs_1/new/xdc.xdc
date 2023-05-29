
# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	
#VGA Connector
set_property PACKAGE_PIN G19 [get_ports {pixel[8]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[8]}]
set_property PACKAGE_PIN H19 [get_ports {pixel[9]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[9]}]
set_property PACKAGE_PIN J19 [get_ports {pixel[10]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[10]}]
set_property PACKAGE_PIN N19 [get_ports {pixel[11]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[11]}]
set_property PACKAGE_PIN N18 [get_ports {pixel[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[0]}]
set_property PACKAGE_PIN L18 [get_ports {pixel[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[1]}]
set_property PACKAGE_PIN K18 [get_ports {pixel[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[2]}]
set_property PACKAGE_PIN J18 [get_ports {pixel[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[3]}]
set_property PACKAGE_PIN J17 [get_ports {pixel[4]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[4]}]
set_property PACKAGE_PIN H17 [get_ports {pixel[5]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[5]}]
set_property PACKAGE_PIN G17 [get_ports {pixel[6]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[6]}]
set_property PACKAGE_PIN D17 [get_ports {pixel[7]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {pixel[7]}]
set_property PACKAGE_PIN P19 [get_ports hsync]						
	set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property PACKAGE_PIN R19 [get_ports vsync]						
	set_property IOSTANDARD LVCMOS33 [get_ports vsync]
	
set_property PACKAGE_PIN V17 [get_ports en]						
        set_property IOSTANDARD LVCMOS33 [get_ports en]
  
set_property PACKAGE_PIN W19 [get_ports left]						
	set_property IOSTANDARD LVCMOS33 [get_ports left]      
set_property PACKAGE_PIN T17 [get_ports right]						
	set_property IOSTANDARD LVCMOS33 [get_ports right] 
set_property PACKAGE_PIN T18 [get_ports up]						
	set_property IOSTANDARD LVCMOS33 [get_ports up] 
set_property PACKAGE_PIN U17 [get_ports down]						
	set_property IOSTANDARD LVCMOS33 [get_ports down]      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      