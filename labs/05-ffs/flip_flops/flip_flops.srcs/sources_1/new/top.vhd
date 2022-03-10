----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2022 02:17:47 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( SW   : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           LED  : out STD_LOGIC_VECTOR (3 downto 0)
           );
end top;

architecture Behavioral of top is
   signal s_q_0 : std_logic;
   signal s_q_1 : std_logic;
   signal s_q_2 : std_logic;
   signal s_q_3 : std_logic;
   
begin
    d_ff_0 : entity work.d_ff_rst
      port map(
          clk   => BTNU,
          rst   => BTNC,
          d     => SW,
          q     => s_q_0,
          q_bar => open
      );
    d_ff_1 : entity work.d_ff_rst
      port map(
          clk   => BTNU,
          rst   => BTNC,
          d     => s_q_0,
          q     => s_q_1,
          q_bar => open
      );
    d_ff_2 : entity work.d_ff_rst
      port map(
          clk   => BTNU,
          rst   => BTNC,
          d     => s_q_1,
          q     => s_q_2,
          q_bar => open
      );
     d_ff_3 : entity work.d_ff_rst
      port map(
          clk   => BTNU,
          rst   => BTNC,
          d     => s_q_2,
          q     => s_q_3,
          q_bar => open
      ); 

LED(3) <= s_q_3;
LED(2) <= s_q_2;
LED(1) <= s_q_1;
LED(0) <= s_q_0;

end Behavioral;
