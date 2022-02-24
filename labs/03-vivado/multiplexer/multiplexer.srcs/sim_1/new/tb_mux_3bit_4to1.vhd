library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_mux_3bit_4to1 is
    -- Entity of testbench is always empty
end entity tb_mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_mux_3bit_4to1 is

    -- Local signals
    signal s_a           : std_logic_vector(3 - 1 downto 0);
    signal s_b           : std_logic_vector(3 - 1 downto 0);
    signal s_c           : std_logic_vector(3 - 1 downto 0);
    signal s_d           : std_logic_vector(3 - 1 downto 0);
    signal s_sel         : std_logic_vector(2 - 1 downto 0);
    signal s_f           : std_logic_vector(3 - 1 downto 0);


begin
    -- Connecting testbench signals with mux_3bit_4to1
    -- entity (Unit Under Test)
    uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
        port map(
            d_i           => s_d,
            c_i           => s_c,
            b_i           => s_b,
            a_i           => s_a,
            sel_i         => s_sel,
            f_o           => s_f
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case ...
        s_d <= "100"; s_c <= "101"; s_b <= "111"; s_a <= "010"; 
        s_sel <= "00";  wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_f = "010"))
        report "Input combination FAILED" severity error;
        s_sel <= "01";  wait for 100 ns;
        assert ((s_f = "111"))
        report "Input combination FAILED" severity error;
        s_sel <= "10";  wait for 100 ns;
        assert ((s_f = "101"))
        report "Input combination FAILED" severity error;
        s_sel <= "11";  wait for 100 ns;
        assert ((s_f = "100"))
        report "Input combination FAILED" severity error;
wait;

end process p_stimulus;
end architecture testbench;

