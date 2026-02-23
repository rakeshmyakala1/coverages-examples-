1) cover all values of a ramndom variable b/w 0 and 100 // Starts a numbered coverage example description.
// Blank line kept for readability.
 class ram; // Declares a class used to hold random variables and coverage.
  randc bit [6:0] a; // 7-bit to cover values 0â€“100 // Declares a cyclic-random variable for stimulus generation.
  covergroup cov; // Declares a covergroup to collect functional coverage.
    cp1: coverpoint a { bins b[] = {[0:100]}; } // Defines a coverpoint and its bins for coverage measurement.
  endgroup // Ends the covergroup definition.
// Blank line kept for readability.
  function new(); // Begins the constructor where objects are initialized.
    cov = new(); // instantiate covergroup inside the constructor // Constructs an object or covergroup instance.
  endfunction // Ends the constructor/function definition.
endclass // Ends the class definition.
// Blank line kept for readability.
module rakesh; // Declares a test module for simulation.
  ram pkt; // Declares a variable or object handle.
// Blank line kept for readability.
  initial begin // Starts an initial simulation process.
    pkt = new(); // create the ram object // Constructs an object or covergroup instance.
// Blank line kept for readability.
    repeat(201) begin // Repeats stimulus and sampling to increase coverage.
      void'(pkt.randomize()); // randomize 'a' // Randomizes class variables and ignores return status.
      pkt.cov.sample();       // sample the covergroup // Keeps this SystemVerilog statement as part of the coverage example.
    end // Ends the current begin/end block.
    $display("Coverage = %0.2f%%", pkt.cov.get_coverage()); // Prints simulation information to the console.
    $finish; // Stops the simulation run.
  end // Ends the current begin/end block.
endmodule  // Ends the module definition.
// Blank line kept for readability.
 2 cover even and odd multiple of 10 cover inside 0:100; // Continues a numbered coverage example description.
// Blank line kept for readability.
  class ram; // Declares a class used to hold random variables and coverage.
  randc bit [6:0] a; // 7-bit to cover values 0â€“100 // Declares a cyclic-random variable for stimulus generation.
  covergroup cov(); // Declares a covergroup to collect functional coverage.
    cp1_eve: coverpoint a { bins even_bin[] = {[0:100]} with (item %2==0);} // Defines a coverpoint and its bins for coverage measurement.
	cp2_odd: coverpoint a {bins odd_bin[] = {[0:100]} with (item %2 == 1);} // Defines a coverpoint and its bins for coverage measurement.
	cp3_mul: coverpoint a {bins mul_10[] =  {[0:100]} with (item % 10 == 0);} // Defines a coverpoint and its bins for coverage measurement.
  endgroup // Ends the covergroup definition.
// Blank line kept for readability.
  function new(); // Begins the constructor where objects are initialized.
    cov = new(); // instantiate covergroup inside the constructor // Constructs an object or covergroup instance.
  endfunction // Ends the constructor/function definition.
endclass // Ends the class definition.
// Blank line kept for readability.
module rakesh; // Declares a test module for simulation.
  ram pkt; // Declares a variable or object handle.
// Blank line kept for readability.
  initial begin // Starts an initial simulation process.
    pkt = new(); // create the ram object // Constructs an object or covergroup instance.
// Blank line kept for readability.
    repeat(100) begin // Repeats stimulus and sampling to increase coverage.
      void'(pkt.randomize()); // randomize 'a' // Randomizes class variables and ignores return status.
      pkt.cov.sample();       // sample the covergroup // Keeps this SystemVerilog statement as part of the coverage example.
    end // Ends the current begin/end block.
    $display("Coverage = %0.2f%%", pkt.cov.get_coverage()); // Prints simulation information to the console.
    $finish; // Stops the simulation run.
  end // Ends the current begin/end block.
endmodule  // Ends the module definition.
// Blank line kept for readability.
3) cover all 52_deck card // Starts a numbered coverage example description.
// Blank line kept for readability.
 class ram; // Declares a class used to hold random variables and coverage.
  typedef enum {ACE = 0, ONE = 1, TWO = 2, THREE = 3, FOUR = 4, FIVE = 5, SIX = 6, // Defines an enum type for symbolic value names.
                SEVEN = 7, EIGHT = 8, NINE = 9, TEN = 10, JACK = 11, QUEEN = 12, KING = 13} values; // Keeps this SystemVerilog statement as part of the coverage example.
 typedef enum {HEARTS, DIAMONDS, CLUBS, SPADES}suits; // Defines an enum type for symbolic value names.
 rand values value; // Declares a random variable for constrained random testing.
 rand suits suit; // Declares a random variable for constrained random testing.
// Blank line kept for readability.
 covergroup cov (); // Declares a covergroup to collect functional coverage.
 cp_value: coverpoint value {bins bin[] = {[1:10]}; // Defines a coverpoint and its bins for coverage measurement.
                         bins bin_2 = {ACE}; // Keeps this SystemVerilog statement as part of the coverage example.
						 bins bin_3 []= {JACK,QUEEN,KING}; // Keeps this SystemVerilog statement as part of the coverage example.
						 } // Keeps this SystemVerilog statement as part of the coverage example.
cp_suit: coverpoint suit {bins b_1 = {HEARTS}; // Defines a coverpoint and its bins for coverage measurement.
                          bins b_2 = {DIAMONDS}; // Keeps this SystemVerilog statement as part of the coverage example.
						  bins b_3 = {CLUBS}; // Keeps this SystemVerilog statement as part of the coverage example.
						  bins b_4 = {SPADES}; // Keeps this SystemVerilog statement as part of the coverage example.
						  }	 // Keeps this SystemVerilog statement as part of the coverage example.
cross_vales_suit : cross cp_value,cp_suit; // Defines cross coverage between multiple coverpoints.
endgroup // Ends the covergroup definition.
// Blank line kept for readability.
     function new(); // Begins the constructor where objects are initialized.
	     cov = new(); // Constructs an object or covergroup instance.
	  endfunction  // Ends the constructor/function definition.
endclass // Ends the class definition.
// Blank line kept for readability.
module rakesh; // Declares a test module for simulation.
ram pkt ; // Declares a variable or object handle.
initial begin // Starts an initial simulation process.
repeat(100)begin // Repeats stimulus and sampling to increase coverage.
pkt=new(); // Constructs an object or covergroup instance.
void'(pkt.randomize()); // Randomizes class variables and ignores return status.
pkt.cov.sample(); // Keeps this SystemVerilog statement as part of the coverage example.
// Blank line kept for readability.
 end // Ends the current begin/end block.
  $display("Coverage = %0.2f%%", pkt.cov.get_coverage()); // Prints simulation information to the console.
 end // Ends the current begin/end block.
 endmodule  // Ends the module definition.
// Blank line kept for readability.
 4) cover students marks bins 0_50,51_75,76_100 // Starts a numbered coverage example description.
// Blank line kept for readability.
 class ram; // Declares a class used to hold random variables and coverage.
rand bit [0:6] marks; // Declares a random variable for constrained random testing.
covergroup cov(); // Declares a covergroup to collect functional coverage.
 mark:coverpoint marks{bins low ={[0:51]}; // Defines a coverpoint and its bins for coverage measurement.
                        bins medium_s = {[51:75]}; // Keeps this SystemVerilog statement as part of the coverage example.
						bins high = {[76:100]}; // Keeps this SystemVerilog statement as part of the coverage example.
						} // Keeps this SystemVerilog statement as part of the coverage example.
endgroup // Ends the covergroup definition.
function new(); // Begins the constructor where objects are initialized.
cov = new(); // Constructs an object or covergroup instance.
endfunction // Ends the constructor/function definition.
endclass // Ends the class definition.
module rakesh; // Declares a test module for simulation.
ram pkt ; // Declares a variable or object handle.
initial begin // Starts an initial simulation process.
repeat(100)begin // Repeats stimulus and sampling to increase coverage.
pkt=new(); // Constructs an object or covergroup instance.
void'(pkt.randomize()); // Randomizes class variables and ignores return status.
pkt.cov.sample(); // Keeps this SystemVerilog statement as part of the coverage example.
// Blank line kept for readability.
 end // Ends the current begin/end block.
  $display("Coverage = %0.2f%%", pkt.cov.get_coverage()); // Prints simulation information to the console.
 end // Ends the current begin/end block.
 endmodule  // Ends the module definition.
// Blank line kept for readability.
  5) cover dice 1 to 6  // Starts a numbered coverage example description.
// Blank line kept for readability.
  class ram; // Declares a class used to hold random variables and coverage.
rand bit [0:2] dice; // Declares a random variable for constrained random testing.
covergroup cov(); // Declares a covergroup to collect functional coverage.
 mark:coverpoint dice{bins vales[] ={[1:6]}; // Defines a coverpoint and its bins for coverage measurement.
						} // Keeps this SystemVerilog statement as part of the coverage example.
endgroup // Ends the covergroup definition.
function new(); // Begins the constructor where objects are initialized.
cov = new(); // Constructs an object or covergroup instance.
endfunction // Ends the constructor/function definition.
endclass // Ends the class definition.
// Blank line kept for readability.
module rakesh; // Declares a test module for simulation.
ram pkt ; // Declares a variable or object handle.
initial begin // Starts an initial simulation process.
repeat(100)begin // Repeats stimulus and sampling to increase coverage.
pkt=new(); // Constructs an object or covergroup instance.
void'(pkt.randomize()); // Randomizes class variables and ignores return status.
pkt.cov.sample(); // Keeps this SystemVerilog statement as part of the coverage example.
// Blank line kept for readability.
 end // Ends the current begin/end block.
  $display("Coverage = %0.2f%%", pkt.cov.get_coverage()); // Prints simulation information to the console.
 end // Ends the current begin/end block.
 endmodule // Ends the module definition.
// Blank line kept for readability.
// Blank line kept for readability.
// Blank line kept for readability.
6) cover trafiic light durations green (30-60) yellow (5-10) red(50-90); // Starts a numbered coverage example description.
// Blank line kept for readability.
 class ram; // Declares a class used to hold random variables and coverage.
rand bit[0:6] duration; // Declares a random variable for constrained random testing.
typedef enum {red,yellow,green} light_colors; // Defines an enum type for symbolic value names.
rand light_colors lights; // Declares a random variable for constrained random testing.
 covergroup  cov(); // Declares a covergroup to collect functional coverage.
  cp1: coverpoint duration { bins yellow_d = {[5:10]};  // Defines a coverpoint and its bins for coverage measurement.
                           bins green_d = {[30:60]}; // Keeps this SystemVerilog statement as part of the coverage example.
						  bins red_d = {[50:90]}; // Keeps this SystemVerilog statement as part of the coverage example.
							} // Keeps this SystemVerilog statement as part of the coverage example.
 cp2: coverpoint lights; // Defines a coverpoint and its bins for coverage measurement.
 cp_cross: cross cp1,cp2; // Defines cross coverage between multiple coverpoints.
endgroup // Ends the covergroup definition.
function new(); // Begins the constructor where objects are initialized.
cov=new(); // Constructs an object or covergroup instance.
endfunction // Ends the constructor/function definition.
endclass // Ends the class definition.
// Blank line kept for readability.
 module rakesh; // Declares a test module for simulation.
ram pkt ; // Declares a variable or object handle.
initial begin // Starts an initial simulation process.
repeat(100)begin // Repeats stimulus and sampling to increase coverage.
pkt=new(); // Constructs an object or covergroup instance.
void'(pkt.randomize()); // Randomizes class variables and ignores return status.
pkt.cov.sample(); // Keeps this SystemVerilog statement as part of the coverage example.
 end // Ends the current begin/end block.
  $display("Coverage = %0.2f%%", pkt.cov.get_coverage()); // Prints simulation information to the console.
 end // Ends the current begin/end block.
 endmodule // Ends the module definition.
// Blank line kept for readability.
 8) cover temparature values in 4 bins // Starts a numbered coverage example description.
// Blank line kept for readability.
 class ram; // Declares a class used to hold random variables and coverage.
  rand int temperature; // Declares a random variable for constrained random testing.
// Blank line kept for readability.
  covergroup temp_cov; // Declares a covergroup to collect functional coverage.
    cp_temp: coverpoint temperature { // Defines a coverpoint and its bins for coverage measurement.
      bins low     = {[0:20]}; // Keeps this SystemVerilog statement as part of the coverage example.
      bins normal  = {[21:35]}; // Keeps this SystemVerilog statement as part of the coverage example.
      bins warning = {[36:50]}; // Keeps this SystemVerilog statement as part of the coverage example.
      bins critical= {[51:100]}; // Keeps this SystemVerilog statement as part of the coverage example.
    } // Keeps this SystemVerilog statement as part of the coverage example.
  endgroup // Ends the covergroup definition.
// Blank line kept for readability.
  function new(); // Begins the constructor where objects are initialized.
    temp_cov = new(); // Constructs an object or covergroup instance.
  endfunction // Ends the constructor/function definition.
endclass // Ends the class definition.
// Blank line kept for readability.
module rakesh; // Declares a test module for simulation.
  ram pkt = new(); // Keeps this SystemVerilog statement as part of the coverage example.
// Blank line kept for readability.
  initial begin // Starts an initial simulation process.
    repeat (100) begin // Repeats stimulus and sampling to increase coverage.
      void'(pkt.randomize() with {temperature inside {[0:100]};}); // Randomizes class variables and ignores return status.
      pkt.temp_cov.sample(); // Keeps this SystemVerilog statement as part of the coverage example.
    end // Ends the current begin/end block.
    $display("Coverage = %0.2f%%", pkt.temp_cov.get_coverage()); // Prints simulation information to the console.
  end // Ends the current begin/end block.
endmodule */ // Ends the module definition.
// Blank line kept for readability.
9) cover diffrent length of burst transactions // Starts a numbered coverage example description.
// Blank line kept for readability.
class ram; // Declares a class used to hold random variables and coverage.
rand bit [7:0] length; // Declares a random variable for constrained random testing.
rand bit [1:0] burst; // Declares a random variable for constrained random testing.
covergroup cov (); // Declares a covergroup to collect functional coverage.
cp_fixed: coverpoint length iff(burst==00) {bins fix = {[0:15]};} // Defines a coverpoint and its bins for coverage measurement.
cp_incr: coverpoint length iff(burst==01) {bins incr = {[0:255]};} // Defines a coverpoint and its bins for coverage measurement.
cp_wrap:coverpoint length iff(burst==10) {bins wrap = {1,3,7,15};} // Defines a coverpoint and its bins for coverage measurement.
endgroup   // Ends the covergroup definition.
  function new(); // Begins the constructor where objects are initialized.
    cov = new(); // Constructs an object or covergroup instance.
  endfunction // Ends the constructor/function definition.
endclass // Ends the class definition.
// Blank line kept for readability.
module rakesh; // Declares a test module for simulation.
  ram pkt = new(); // Keeps this SystemVerilog statement as part of the coverage example.
  initial begin // Starts an initial simulation process.
    repeat (100) begin // Repeats stimulus and sampling to increase coverage.
      void'(pkt.randomize()); // Randomizes class variables and ignores return status.
      pkt.cov.sample(); // Keeps this SystemVerilog statement as part of the coverage example.
	  	$display("length=%d,burst=%d",pkt.length,pkt.burst); // Prints simulation information to the console.
    end // Ends the current begin/end block.
// Blank line kept for readability.
    $display("Coverage = %0.2f%%", pkt.cov.get_coverage()); // Prints simulation information to the console.
  end // Ends the current begin/end block.
endmodule */ // Ends the module definition.
// Blank line kept for readability.
10) Cover all combinations of signal A (0/1) and signal B (0/1) // Starts a numbered coverage example description.
// Blank line kept for readability.
// Blank line kept for readability.
 class ram; // Declares a class used to hold random variables and coverage.
rand bit a,b; // Declares a random variable for constrained random testing.
covergroup cov(); // Declares a covergroup to collect functional coverage.
  cp1:coverpoint a {bins zero ={0}; // Defines a coverpoint and its bins for coverage measurement.
                    bins one = {1};} // Keeps this SystemVerilog statement as part of the coverage example.
cp2: coverpoint b {bins zreo = {0}; // Defines a coverpoint and its bins for coverage measurement.
                      bins one = {1};} // Keeps this SystemVerilog statement as part of the coverage example.
cp1_cp2:cross cp1,cp2; // Defines cross coverage between multiple coverpoints.
endgroup // Ends the covergroup definition.
function new(); // Begins the constructor where objects are initialized.
cov = new(); // Constructs an object or covergroup instance.
endfunction // Ends the constructor/function definition.
endclass // Ends the class definition.
// Blank line kept for readability.
module rakesh; // Declares a test module for simulation.
  ram pkt = new(); // Keeps this SystemVerilog statement as part of the coverage example.
  initial begin // Starts an initial simulation process.
    repeat (100) begin // Repeats stimulus and sampling to increase coverage.
      void'(pkt.randomize()); // Randomizes class variables and ignores return status.
      pkt.cov.sample(); // Keeps this SystemVerilog statement as part of the coverage example.
    end // Ends the current begin/end block.
// Blank line kept for readability.
    $display("Coverage = %0.2f%%", pkt.cov.get_coverage()); // Prints simulation information to the console.
  end // Ends the current begin/end block.
endmodule */ // Ends the module definition.
// Blank line kept for readability.
//11) Cover id field values from 0 to 15 in a packet. // Keeps a descriptive inline comment for this section.
// Blank line kept for readability.
/* class ram; // Starts a block-commented section.
rand bit [3:0] id; // Inside a block-commented section.
covergroup cov(); // Inside a block-commented section.
cp1:coverpoint id {bins b1[] = {[0:15]};} // Inside a block-commented section.
endgroup  // Inside a block-commented section.
function new(); // Inside a block-commented section.
cov=new(); // Inside a block-commented section.
endfunction // Inside a block-commented section.
endclass // Inside a block-commented section.
module rakesh; // Inside a block-commented section.
  ram pkt = new(); // Inside a block-commented section.
  initial begin // Inside a block-commented section.
    repeat (100) begin // Inside a block-commented section.
      void'(pkt.randomize()); // Inside a block-commented section.
      pkt.cov.sample(); // Inside a block-commented section.
    end // Inside a block-commented section.
// Blank line kept for readability.
    $display("Coverage = %0.2f%%", pkt.cov.get_coverage()); // Inside a block-commented section.
  end // Inside a block-commented section.
endmodule  */ // Ends a block-commented section.
// Blank line kept for readability.
//12) //Cover binary vector values with even number of 1s // Keeps a descriptive inline comment for this section.
// Blank line kept for readability.
/* class ram; // Starts a block-commented section.
rand bit [3:0] data; // Inside a block-commented section.
covergroup cov(); // Inside a block-commented section.
cp1: coverpoint data iff ($countones(data)%2==0){bins b1 []= {[0:15]} ;} // Inside a block-commented section.
endgroup // Inside a block-commented section.
function new(); // Inside a block-commented section.
cov=new(); // Inside a block-commented section.
endfunction // Inside a block-commented section.
endclass // Inside a block-commented section.
module rakesh; // Inside a block-commented section.
  ram pkt = new(); // Inside a block-commented section.
  initial begin // Inside a block-commented section.
    repeat (100) begin // Inside a block-commented section.
      void'(pkt.randomize()); // Inside a block-commented section.
      pkt.cov.sample(); // Inside a block-commented section.
    end // Inside a block-commented section.
// Blank line kept for readability.
    $display("Coverage = %0.2f%%", pkt.cov.get_coverage()); // Inside a block-commented section.
  end // Inside a block-commented section.
endmodule  */ // Ends a block-commented section.
// Blank line kept for readability.
//13) Cover all valid IP address ranges (first byte: 10, 172, 192). // Keeps a descriptive inline comment for this section.
// Blank line kept for readability.
/* class ram; // Starts a block-commented section.
rand bit [7:0] valid_addr; // Inside a block-commented section.
constraint con {valid_addr inside{10,172,192};} // Inside a block-commented section.
covergroup cov(); // Inside a block-commented section.
cp1: coverpoint valid_addr{bins  b1[] = {10,172, 192};} // Inside a block-commented section.
endgroup // Inside a block-commented section.
function new(); // Inside a block-commented section.
cov = new(); // Inside a block-commented section.
endfunction // Inside a block-commented section.
endclass // Inside a block-commented section.
module rakesh; // Inside a block-commented section.
  ram pkt = new(); // Inside a block-commented section.
  initial begin // Inside a block-commented section.
    repeat (200) begin // Inside a block-commented section.
      void'(pkt.randomize()); // Inside a block-commented section.
      pkt.cov.sample(); // Inside a block-commented section.
    end // Inside a block-commented section.
	$display("covrage = %0.2f%%",pkt.cov.get_coverage()); // Inside a block-commented section.
 end // Inside a block-commented section.
endmodule */ // Ends a block-commented section.
// Blank line kept for readability.
// Blank line kept for readability.
// Blank line kept for readability.
//14) .Cover valid and invalid packet types. // Keeps a descriptive inline comment for this section.
// Blank line kept for readability.
/* class ram; // Starts a block-commented section.
rand bit [2:0] valid_invalid; // Inside a block-commented section.
covergroup cov(); // Inside a block-commented section.
cp1: coverpoint valid_invalid{bins  valid [] = {0,1,2,3,4}; // Inside a block-commented section.
                                bins invalid[] = {5,6,7};} // Inside a block-commented section.
endgroup // Inside a block-commented section.
function new(); // Inside a block-commented section.
cov = new(); // Inside a block-commented section.
endfunction // Inside a block-commented section.
endclass // Inside a block-commented section.
module rakesh; // Inside a block-commented section.
  ram pkt = new(); // Inside a block-commented section.
  initial begin // Inside a block-commented section.
    repeat (100) begin // Inside a block-commented section.
      void'(pkt.randomize()); // Inside a block-commented section.
      pkt.cov.sample(); // Inside a block-commented section.
    end // Inside a block-commented section.
	$display("covrage = %0.2f%%",pkt.cov.get_coverage()); // Inside a block-commented section.
 end // Inside a block-commented section.
endmodule // Inside a block-commented section.
 */ // Ends a block-commented section.
// Blank line kept for readability.
 //i covered all the transation bins along with illegal and igone bins  // Keeps a descriptive inline comment for this section.
// Blank line kept for readability.
/* class ram; // Starts a block-commented section.
rand bit [3:0]data; // Inside a block-commented section.
covergroup cov (); // Inside a block-commented section.
// Blank line kept for readability.
single_value :coverpoint data {bins b1 = (1=>2);} // Inside a block-commented section.
seqounce_off_bins :coverpoint  data {bins b1= (2=>3=>4=>5);} // Inside a block-commented section.
set_off_bits:coverpoint data {bins b1=(1,2=>3,4);} // Inside a block-commented section.
repetation : coverpoint data {bins b1 = (7[*2]);} // Inside a block-commented section.
non_consecutive : coverpoint data {bins b1 = (2[=3]=>5);} // Inside a block-commented section.
goto:coverpoint data {bins b1 = (1[->2]=>9);} // Inside a block-commented section.
ignore: coverpoint data {ignore_bins b1 = {11,12,13}; // Inside a block-commented section.
                         illegal_bins b2 = {14,15};} // Inside a block-commented section.
endgroup // Inside a block-commented section.
function new(); // Inside a block-commented section.
cov=new(); // Inside a block-commented section.
endfunction // Inside a block-commented section.
endclass // Inside a block-commented section.
module rakesh; // Inside a block-commented section.
  ram pkt = new(); // Inside a block-commented section.
  initial begin // Inside a block-commented section.
    repeat (200) begin // Inside a block-commented section.
      void'(pkt.randomize()); // Inside a block-commented section.
      pkt.cov.sample(); // Inside a block-commented section.
    end // Inside a block-commented section.
	$display("covrage = %0.2f%%",pkt.cov.get_coverage()); // Inside a block-commented section.
 end // Inside a block-commented section.
endmodule // Inside a block-commented section.
 */ // Ends a block-commented section.
// Blank line kept for readability.
// Blank line kept for readability.
class explicit; // Declares a class used to hold random variables and coverage.
rand bit[2:0]a; // Declares a random variable for constrained random testing.
rand bit[2:0]b; // Declares a random variable for constrained random testing.
rand bit[2:0]c; // Declares a random variable for constrained random testing.
 constraint ww{a inside{1,2,3,4};} // Applies a constraint to limit randomized values.
constraint xx{b inside{1,2,3,4};} // Applies a constraint to limit randomized values.
constraint zz{c inside{1,2,3,4};}    // Applies a constraint to limit randomized values.
endclass // Ends the class definition.
// Blank line kept for readability.
module rakesh; // Declares a test module for simulation.
bit clk; // Declares a variable or object handle.
explicit p1 =new(); // Keeps this SystemVerilog statement as part of the coverage example.
covergroup cg @(posedge clk); // Declares a covergroup to collect functional coverage.
option.goal=50; // Sets a covergroup option such as goal, weight, or naming.
option.weight=10; // Sets a covergroup option such as goal, weight, or naming.
option.name="rakesh"; // Sets a covergroup option such as goal, weight, or naming.
option.per_instance=0; // Sets a covergroup option such as goal, weight, or naming.
option.at_least=2; // Sets a covergroup option such as goal, weight, or naming.
// Blank line kept for readability.
// Blank line kept for readability.
 //sample coverpoints at posetive clock edges // explicit // Keeps a descriptive inline comment for this section.
   s1:coverpoint p1.a{bins b1[]=(1,2=>3,4);} // set off transition // Defines a coverpoint and its bins for coverage measurement.
// Blank line kept for readability.
s2:coverpoint p1.b{illegal_bins b2 ={1,2};} // Defines a coverpoint and its bins for coverage measurement.
// Blank line kept for readability.
s3:coverpoint p1.c{bins b3=(4[*2]);} // consecutive repetation // Defines a coverpoint and its bins for coverage measurement.
// Blank line kept for readability.
s4:coverpoint p1.a{bins b111=(2<=4[=2]=>3);} // non consicutive repetition // Defines a coverpoint and its bins for coverage measurement.
// Blank line kept for readability.
s5:coverpoint p1.b{bins b7=(2<=3[->2]=>2);} // goto repetition bith are same // Defines a coverpoint and its bins for coverage measurement.
// Blank line kept for readability.
//s6:coverpoint p1.c{ignore_bins b={2,3,4};}    // Keeps a descriptive inline comment for this section.
 /* s1:coverpoint p1.a; // Starts a block-commented section.
s2:coverpoint p1.b; // Inside a block-commented section.
s3:coverpoint p1.c;    // Inside a block-commented section.
s2_s3:cross s1,s2; */ // Ends a block-commented section.
// Blank line kept for readability.
endgroup // Ends the covergroup definition.
// Blank line kept for readability.
covergroup cgr @(posedge clk); // Declares a covergroup to collect functional coverage.
option.goal=70; // Sets a covergroup option such as goal, weight, or naming.
option.weight=5; // Sets a covergroup option such as goal, weight, or naming.
option.name="rakesh3"; // Sets a covergroup option such as goal, weight, or naming.
option.per_instance=1; // Sets a covergroup option such as goal, weight, or naming.
option.at_least=1; // Sets a covergroup option such as goal, weight, or naming.
// Blank line kept for readability.
// Blank line kept for readability.
   s1:coverpoint p1.a{bins b1[]=(1,2=>3,4);}  // Defines a coverpoint and its bins for coverage measurement.
// Blank line kept for readability.
s3:coverpoint p1.c{bins b3=(4[*2]);} // consecutive repetation // Defines a coverpoint and its bins for coverage measurement.
// Blank line kept for readability.
endgroup // Ends the covergroup definition.
// Blank line kept for readability.
always #5 clk=~clk; // Creates a periodic clock toggle.
initial begin // Starts an initial simulation process.
cg p2=new(); // Keeps this SystemVerilog statement as part of the coverage example.
cgr p3=new(); // Keeps this SystemVerilog statement as part of the coverage example.
repeat(200) // Repeats stimulus and sampling to increase coverage.
begin // Keeps this SystemVerilog statement as part of the coverage example.
p1.randomize(); // Keeps this SystemVerilog statement as part of the coverage example.
p2.sample(); // Keeps this SystemVerilog statement as part of the coverage example.
p3.sample(); // Keeps this SystemVerilog statement as part of the coverage example.
p2.get_inst_coverage(); // Keeps this SystemVerilog statement as part of the coverage example.
$display("a=%d,b=%d,c=%d",p1.a,p1.b,p1.c); // Prints simulation information to the console.
end // Ends the current begin/end block.
end // Ends the current begin/end block.
endmodule  // Ends the module definition.
// Blank line kept for readability.
// Blank line kept for readability.
// Blank line kept for readability.
// Blank line kept for readability.
// Blank line kept for readability.
// Blank line kept for readability.
// Blank line kept for readability.
// Blank line kept for readability.
// Blank line kept for readability.
// Blank line kept for readability.
