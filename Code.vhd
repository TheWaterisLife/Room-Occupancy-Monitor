library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RoomOccupancyMonitor is
    Port (
        reset, X, Y, clk : in STD_LOGIC;
        max_occupancy : in IEEE.NUMERIC_STD.unsigned(5 downto 0);
        Z : out STD_LOGIC
    );
end RoomOccupancyMonitor;

architecture Behavioral of RoomOccupancyMonitor is
    signal occupancy_counter : IEEE.NUMERIC_STD.unsigned(5 downto 0) := (others => '0');
    signal room_is_full : boolean := false;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            occupancy_counter <= (others => '0');
            room_is_full <= false;
        elsif rising_edge(clk) then
            if X = '1' then
                occupancy_counter <= occupancy_counter + 1;
            elsif Y = '1' and occupancy_counter > 0 then
                occupancy_counter <= occupancy_counter - 1;
            end if;
        end if;
    end process;

    Z <= '1' when (occupancy_counter >= max_occupancy) else '0';
end Behavioral;
