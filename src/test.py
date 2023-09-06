import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
@cocotb.test()
async def test_lfsr(dut):
    dut._log.info("start")
    dut.INPUT.value = 1
await Timer(1, units="ms")
assert dut.OUTPUT.value == 0
clock = Clock(dut.clk, 1, units="ms")
cocotb.start_soon(clock.start())
dut.rst_n.value = 0 # low to reset
await ClockCycles(dut.clk, 10)
dut.rst_n.value = 1 #take out of reset


      
