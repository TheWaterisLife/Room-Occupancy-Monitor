library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RoomOccupancyMonitor_tb is
end RoomOccupancyMonitor_tb;

architecture Behavioral of RoomOccupancyMonitor_tb is
    signal reset1, X1, Y1, Z1, clk : STD_LOGIC := '0';
    signal maxoc : IEEE.NUMERIC_STD.unsigned(5 downto 0) := (others => '0');
    constant maximum_simulation : time := 240 ns;
    constant clock_period : time := 10 ns;
begin
    uut: entity work.RoomOccupancyMonitor
        port map (
            reset => reset1,
            X => X1,
            Y => Y1,
            clk => clk,
            max_occupancy => maxoc,
            Z => Z1
        );

    clk_gen: process
        variable simulation_time : time;
    begin
        simulation_time := 0 ns;
        while simulation_time <= maximum_simulation loop
            clk <= '0';
            wait for clock_period/2;
            clk <= '1';
            wait for clock_period/2;
            simulation_time := simulation_time + clock_period;
        end loop;
        wait;
    end process;

    simul_gen : process
    begin
        maxoc <= "111111"; -- max occupancy 63
        reset1 <= '1';
        X1 <= '0';
        Y1 <= '0';
        wait for clock_period;
        -- start
        reset1 <= '0';
        wait for clock_period;
        X1 <= '1';
        wait for clock_period;
        -- Continue with the rest of the testbench signals as needed
        for i in 1 to 63 loop
            wait for clock_period;
            X1 <= '1';
        end loop;
        wait for clock_period;
        Y1 <= '1';
        wait for clock_period;
        X1 <= '0';
        wait for clock_period;
        reset1 <= '1';
        wait for clock_period;
        reset1 <= '0';
        wait;
    end process;
end Behavioral;
