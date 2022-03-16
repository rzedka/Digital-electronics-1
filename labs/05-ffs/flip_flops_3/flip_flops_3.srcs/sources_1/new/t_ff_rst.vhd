----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2022 01:20:08 PM
-- Design Name: 
-- Module Name: d_ff_rst - Behavioral
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

entity t_ff_rst is
    Port ( clk   : in STD_LOGIC;
           rst   : in STD_LOGIC;
           t     : in STD_LOGIC;
           q_0     : out STD_LOGIC;
           q_0_bar : out STD_LOGIC;
           
           q_1     : out STD_LOGIC;
           q_1_bar : out STD_LOGIC
           );
end t_ff_rst;

architecture Behavioral of t_ff_rst is
signal q_n    : std_logic;

begin
 --------------------------------------------------------
    p_d_ff_rst : process(clk)
    begin
        if rising_edge(clk) then  -- Synchronous process
            if (rst = '1') then

                q_n   <= '0';
                q_0     <= '0';
                q_0_bar <= '1';
                q_1     <= '0';
                q_1_bar <= '1';
            else
            
               
               
               --q_n <= (t and not(q_n)) or ( not(t) and q_n);
               q_n <= t xor q_n;
               
               q_0     <= q_n;
               q_0_bar <= not q_n;
               
               q_1     <= t xor q_n;
               q_1_bar <= not(t xor q_n);
               
            end if;
        end if;
    end process p_d_ff_rst;
end architecture Behavioral;
