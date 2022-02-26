
# Lab 1: Radim Zedka - solution

### De Morgan's laws

1. Equations of all three versions of logic function f(c,b,a):

   ![Logic function](./images/Assignm_01_Equations.gif)

2. Listing of VHDL architecture from design file (`design.vhd`) for all three functions. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture dataflow of demorgan is
begin
    f_org_o  <= (not(b) and a) or (not(c) and not(b));
    f_nand_o_v1 <= ((b nand b) nand ((a nand a) nand c)) nand ((b nand b) nand ((a nand a) nand c));
    f_nand_o_v2 <= ((b nand b) nand a ) nand ( (c nand c) nand (b nand b));
    f_nor_o_v1  <= b nor (a nor (c nor c));
    f_nor_o_v2  <= ((b nor (a nor a)) nor (b nor c)) nor ((b nor (a nor a)) nor (b nor c));
end architecture dataflow;
```

3. Complete table with logic functions' values:

| **c** | **b** |**a** | **f(c,b,a)_ORG** | **f(c,b,a)_NAND** | **f(c,b,a)_NOR** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 | 1 | 1 |
| 0 | 0 | 1 | 1 | 1 | 1 |
| 0 | 1 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 | 1 | 1 |
| 1 | 1 | 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 |

### Distributive laws

1. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure](./images/assignment_01_waveforms.jpg)

2. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/x/8aW2)
