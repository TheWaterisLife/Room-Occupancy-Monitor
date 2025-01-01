# Room Occupancy Monitoring System

This project implements a digital system for monitoring room occupancy using VHDL. It features an occupancy counter based on two photocells for entry and exit, and triggers an indicator light when the room reaches maximum occupancy.

## Overview

### Features:
- Tracks room occupancy using two photocells: one for entry (X) and one for exit (Y).
- Adjustable max_occupancy up to 63, stored in a 6-bit register.
- Red indicator light (Z) turns on when the room reaches maximum occupancy.
- Reset functionality to reset the occupancy counter.

### System Components:
- **Photocells (X and Y)**: Binary signals indicating entry and exit.
- **Occupancy Counter**: A register that increments or decrements based on entry or exit signals.
- **Max Occupancy Register**: Stores the maximum allowed occupancy.
- **Reset Signal**: Resets the system to its initial state.
- **Indicator Light (Z)**: Lights up when the room is full.

## Files

### 1. Code.vhd
This file contains the VHDL code for the room occupancy monitor system. It defines the `RoomOccupancyMonitor` entity and includes the logic for counting occupancy, adjusting based on signals, and triggering the indicator light.

### 2. Testbench.vhd
This file includes the VHDL testbench used to simulate the system's functionality. It simulates various conditions for entry, exit, and reset.

### 3. Vivado Logs
The Vivado logs will provide detailed information about the synthesis process, such as resource utilization, cell usage, and any warnings or errors during synthesis. The logs can be used to ensure that the design is optimized for FPGA implementation.

## Setup and Simulation

### Requirements:
- **Xilinx Vivado**: To synthesize the VHDL design for FPGA implementation.
- **ModelSim**: To run the simulation and observe the design's behavior.

### Steps to Simulate:

1. **Compile the VHDL Files**:
   Open a terminal in your project directory and compile the VHDL files:
   ```bash
   vcom code.vhd
   vcom testbench.vhd

2. **Run Simulation**:
    Start the simulation using ModelSim to verify that the design behaves as expected:
        vsim RoomOccupancyMonitor_tb

3. **Observe the Results**:
    After running the simulation, observe the behavior of the system in ModelSim's waveform viewer:
    - Verify that the occupancy counter increments when an entry (X = 1) is detected.
    - Ensure that the counter decrements when an exit (Y = 1) is detected.
    - Confirm that the red indicator light (Z) turns on when the room reaches the max_occupancy.

4. **Synthesis**:
    Use Xilinx Vivado to synthesize the design for FPGA implementation. Generate a report that includes resource utilization and any warnings or errors that might occur during synthesis:
        vivado -mode batch -source synth.tcl


## Vivado Logs:
The synthesis process in Vivado will generate logs detailing the resource usage, warnings, and errors. These logs can be reviewed to ensure the design is synthesizing correctly. The logs typically include:

- **Utilization Summary**: Information about the number of logic elements, LUTs (Look-Up Tables), flip-flops, and other resources used by the design.
- **Warnings/Errors**: Any issues encountered during synthesis, such as unconnected ports or mismatched signal types.
- **Timing Analysis**: Data about the timing performance of the design to ensure that it meets the FPGA’s clock constraints.

The synth.tcl script automates the synthesis process and generates a synthesis report, providing a detailed look at the optimization and resource utilization.

## Test Scenarios:
To verify that the system works correctly, consider testing the following scenarios:

- **Increment Occupancy**: Simulate a series of entries (X = 1) and confirm that the occupancy counter increases correctly.
- **Decrement Occupancy**: Simulate exits (Y = 1) and verify that the counter decreases correctly.
- **Maximum Occupancy**: Ensure that when the room reaches max_occupancy, the red indicator (Z) lights up.
- **Reset Functionality**: Test the reset functionality (reset = 1) to ensure the system returns to its initial state with the counter set to zero.

# Conclusion
This project implements a simple yet efficient system for monitoring room occupancy using VHDL. The design is verified using ModelSim simulations and synthesized using Vivado for FPGA deployment. The synthesis results confirm that the design is optimized for minimal resource consumption, making it suitable for FPGA-based implementations.
