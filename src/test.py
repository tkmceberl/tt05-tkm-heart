import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

# Define your test function
@cocotb.test()
async def test_tb(dut):
    # Create a clock with a period of 10ns
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.fork(clock.start())  # Start the clock

    # Reset and initialize signals
    dut.rst_n <= 0
    dut.ena <= 0
    dut.ui_in <= 0
    dut.uio_in <= 0
    await FallingEdge(dut.clk)
    dut.rst_n <= 1

    # Define the expected 7-segment values
    segments = [63, 6, 91, 79, 102, 109, 124, 7, 127, 103]

    # Check segments with different compare values
    for compare_value in [1, 3]:
        dut.ui_in <= compare_value
        max_count = compare_value << 10
        dut._log.info(f"Check all segments with MAX_COUNT set to {max_count}")

        for i in range(15):
            await ClockCycles(dut.clk, max_count)
            assert int(dut.segments) == segments[i % 10]

        dut.rst_n <= 0
        await ClockCycles(dut.clk, 10)
        dut.rst_n <= 1
