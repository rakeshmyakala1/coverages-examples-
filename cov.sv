1) cover all values of a ramndom variable b/w 0 and 100 // Example objective
 
 class ram; // Class for randomized stimulus and coverage model
  randc bit [6:0] a; // 7-bit to cover values 0–100
  covergroup cov; // Covergroup declaration
    cp1: coverpoint a { bins b[] = {[0:100]}; } // Coverpoint definition
  endgroup

  function new();
    cov = new(); // instantiate covergroup inside the constructor
  endfunction
endclass

module rakesh;
  ram pkt;

  initial begin
    pkt = new(); // create the ram object

    repeat(201) begin
      void'(pkt.randomize()); // randomize 'a'
      pkt.cov.sample();       // sample the covergroup
    end
    $display("Coverage = %0.2f%%", pkt.cov.get_coverage());
    $finish;
  end
endmodule 

 2 cover even and odd multiple of 10 cover inside 0:100; // Example objective

  class ram; // Class for randomized stimulus and coverage model
  randc bit [6:0] a; // 7-bit to cover values 0–100
  covergroup cov(); // Covergroup declaration
    cp1_eve: coverpoint a { bins even_bin[] = {[0:100]} with (item %2==0);} // Coverpoint definition
	cp2_odd: coverpoint a {bins odd_bin[] = {[0:100]} with (item %2 == 1);} // Coverpoint definition
	cp3_mul: coverpoint a {bins mul_10[] =  {[0:100]} with (item % 10 == 0);} // Coverpoint definition
  endgroup

  function new();
    cov = new(); // instantiate covergroup inside the constructor
  endfunction
endclass

module rakesh;
  ram pkt;

  initial begin
    pkt = new(); // create the ram object

    repeat(100) begin
      void'(pkt.randomize()); // randomize 'a'
      pkt.cov.sample();       // sample the covergroup
    end
    $display("Coverage = %0.2f%%", pkt.cov.get_coverage());
    $finish;
  end
endmodule 

3) cover all 52_deck card // Example objective

 class ram; // Class for randomized stimulus and coverage model
  typedef enum {ACE = 0, ONE = 1, TWO = 2, THREE = 3, FOUR = 4, FIVE = 5, SIX = 6, // Enum for symbolic value mapping
                SEVEN = 7, EIGHT = 8, NINE = 9, TEN = 10, JACK = 11, QUEEN = 12, KING = 13} values;
 typedef enum {HEARTS, DIAMONDS, CLUBS, SPADES}suits; // Enum for symbolic value mapping
 rand values value; // Randomized variable used for coverage sampling
 rand suits suit; // Randomized variable used for coverage sampling
 
 covergroup cov (); // Covergroup declaration
 cp_value: coverpoint value {bins bin[] = {[1:10]}; // Coverpoint definition
                         bins bin_2 = {ACE}; // Coverage bin definition
						 bins bin_3 []= {JACK,QUEEN,KING}; // Coverage bin definition
						 }
cp_suit: coverpoint suit {bins b_1 = {HEARTS}; // Coverpoint definition
                          bins b_2 = {DIAMONDS}; // Coverage bin definition
						  bins b_3 = {CLUBS}; // Coverage bin definition
						  bins b_4 = {SPADES}; // Coverage bin definition
						  }	
cross_vales_suit : cross cp_value,cp_suit; // Cross coverage between coverpoints
endgroup
						 
     function new();
	     cov = new();
	  endfunction 
endclass

module rakesh;
ram pkt ;
initial begin
repeat(100)begin
pkt=new();
void'(pkt.randomize());
pkt.cov.sample();
 
 end
  $display("Coverage = %0.2f%%", pkt.cov.get_coverage());
 end
 endmodule 
 
 4) cover students marks bins 0_50,51_75,76_100 // Example objective

 class ram; // Class for randomized stimulus and coverage model
rand bit [0:6] marks; // Randomized variable used for coverage sampling
covergroup cov(); // Covergroup declaration
 mark:coverpoint marks{bins low ={[0:51]}; // Coverpoint definition
                        bins medium_s = {[51:75]}; // Coverage bin definition
						bins high = {[76:100]}; // Coverage bin definition
						}
endgroup
function new();
cov = new();
endfunction
endclass
module rakesh;
ram pkt ;
initial begin
repeat(100)begin
pkt=new();
void'(pkt.randomize());
pkt.cov.sample();
 
 end
  $display("Coverage = %0.2f%%", pkt.cov.get_coverage());
 end
 endmodule 
 
  5) cover dice 1 to 6  // Example objective

  class ram; // Class for randomized stimulus and coverage model
rand bit [0:2] dice; // Randomized variable used for coverage sampling
covergroup cov(); // Covergroup declaration
 mark:coverpoint dice{bins vales[] ={[1:6]}; // Coverpoint definition
						}
endgroup
function new();
cov = new();
endfunction
endclass

module rakesh;
ram pkt ;
initial begin
repeat(100)begin
pkt=new();
void'(pkt.randomize());
pkt.cov.sample();
 
 end
  $display("Coverage = %0.2f%%", pkt.cov.get_coverage());
 end
 endmodule
	 
 

6) cover trafiic light durations green (30-60) yellow (5-10) red(50-90); // Example objective

 class ram; // Class for randomized stimulus and coverage model
rand bit[0:6] duration; // Randomized variable used for coverage sampling
typedef enum {red,yellow,green} light_colors; // Enum for symbolic value mapping
rand light_colors lights; // Randomized variable used for coverage sampling
 covergroup  cov(); // Covergroup declaration
  cp1: coverpoint duration { bins yellow_d = {[5:10]};  // Coverpoint definition
                           bins green_d = {[30:60]}; // Coverage bin definition
						  bins red_d = {[50:90]}; // Coverage bin definition
							}
 cp2: coverpoint lights; // Coverpoint definition
 cp_cross: cross cp1,cp2; // Cross coverage between coverpoints
endgroup
function new();
cov=new();
endfunction
endclass

 module rakesh;
ram pkt ;
initial begin
repeat(100)begin
pkt=new();
void'(pkt.randomize());
pkt.cov.sample();
 end
  $display("Coverage = %0.2f%%", pkt.cov.get_coverage());
 end
 endmodule
  
 8) cover temparature values in 4 bins // Example objective
 
 class ram; // Class for randomized stimulus and coverage model
  rand int temperature; // Randomized variable used for coverage sampling

  covergroup temp_cov; // Covergroup declaration
    cp_temp: coverpoint temperature { // Coverpoint definition
      bins low     = {[0:20]}; // Coverage bin definition
      bins normal  = {[21:35]}; // Coverage bin definition
      bins warning = {[36:50]}; // Coverage bin definition
      bins critical= {[51:100]}; // Coverage bin definition
    }
  endgroup

  function new();
    temp_cov = new();
  endfunction
endclass

module rakesh;
  ram pkt = new();

  initial begin
    repeat (100) begin
      void'(pkt.randomize() with {temperature inside {[0:100]};});
      pkt.temp_cov.sample();
    end
    $display("Coverage = %0.2f%%", pkt.temp_cov.get_coverage());
  end
endmodule */

9) cover diffrent length of burst transactions // Example objective

class ram; // Class for randomized stimulus and coverage model
rand bit [7:0] length; // Randomized variable used for coverage sampling
rand bit [1:0] burst; // Randomized variable used for coverage sampling
covergroup cov (); // Covergroup declaration
cp_fixed: coverpoint length iff(burst==00) {bins fix = {[0:15]};} // Coverpoint definition
cp_incr: coverpoint length iff(burst==01) {bins incr = {[0:255]};} // Coverpoint definition
cp_wrap:coverpoint length iff(burst==10) {bins wrap = {1,3,7,15};} // Coverpoint definition
endgroup  
  function new();
    cov = new();
  endfunction
endclass

module rakesh;
  ram pkt = new();
  initial begin
    repeat (100) begin
      void'(pkt.randomize());
      pkt.cov.sample();
	  	$display("length=%d,burst=%d",pkt.length,pkt.burst);
    end

    $display("Coverage = %0.2f%%", pkt.cov.get_coverage());
  end
endmodule */

10) Cover all combinations of signal A (0/1) and signal B (0/1) // Example objective


 class ram; // Class for randomized stimulus and coverage model
rand bit a,b; // Randomized variable used for coverage sampling
covergroup cov(); // Covergroup declaration
  cp1:coverpoint a {bins zero ={0}; // Coverpoint definition
                    bins one = {1};} // Coverage bin definition
cp2: coverpoint b {bins zreo = {0}; // Coverpoint definition
                      bins one = {1};} // Coverage bin definition
cp1_cp2:cross cp1,cp2; // Cross coverage between coverpoints
endgroup
function new();
cov = new();
endfunction
endclass

module rakesh;
  ram pkt = new();
  initial begin
    repeat (100) begin
      void'(pkt.randomize());
      pkt.cov.sample();
    end

    $display("Coverage = %0.2f%%", pkt.cov.get_coverage());
  end
endmodule */

//11) Cover id field values from 0 to 15 in a packet.

/* class ram;
rand bit [3:0] id; // Randomized variable used for coverage sampling
covergroup cov(); // Covergroup declaration
cp1:coverpoint id {bins b1[] = {[0:15]};} // Coverpoint definition
endgroup 
function new();
cov=new();
endfunction
endclass
module rakesh;
  ram pkt = new();
  initial begin
    repeat (100) begin
      void'(pkt.randomize());
      pkt.cov.sample();
    end

    $display("Coverage = %0.2f%%", pkt.cov.get_coverage());
  end
endmodule  */

//12) //Cover binary vector values with even number of 1s

/* class ram;
rand bit [3:0] data; // Randomized variable used for coverage sampling
covergroup cov(); // Covergroup declaration
cp1: coverpoint data iff ($countones(data)%2==0){bins b1 []= {[0:15]} ;} // Coverpoint definition
endgroup
function new();
cov=new();
endfunction
endclass
module rakesh;
  ram pkt = new();
  initial begin
    repeat (100) begin
      void'(pkt.randomize());
      pkt.cov.sample();
    end

    $display("Coverage = %0.2f%%", pkt.cov.get_coverage());
  end
endmodule  */

//13) Cover all valid IP address ranges (first byte: 10, 172, 192).

/* class ram;
rand bit [7:0] valid_addr; // Randomized variable used for coverage sampling
constraint con {valid_addr inside{10,172,192};} // Constraint limits legal random values
covergroup cov(); // Covergroup declaration
cp1: coverpoint valid_addr{bins  b1[] = {10,172, 192};} // Coverpoint definition
endgroup
function new();
cov = new();
endfunction
endclass
module rakesh;
  ram pkt = new();
  initial begin
    repeat (200) begin
      void'(pkt.randomize());
      pkt.cov.sample();
    end
	$display("covrage = %0.2f%%",pkt.cov.get_coverage());
 end
endmodule */



//14) .Cover valid and invalid packet types.

/* class ram;
rand bit [2:0] valid_invalid; // Randomized variable used for coverage sampling
covergroup cov(); // Covergroup declaration
cp1: coverpoint valid_invalid{bins  valid [] = {0,1,2,3,4}; // Coverpoint definition
                                bins invalid[] = {5,6,7};} // Coverage bin definition
endgroup
function new();
cov = new();
endfunction
endclass
module rakesh;
  ram pkt = new();
  initial begin
    repeat (100) begin
      void'(pkt.randomize());
      pkt.cov.sample();
    end
	$display("covrage = %0.2f%%",pkt.cov.get_coverage());
 end
endmodule
 */
 
 //i covered all the transation bins along with illegal and igone bins 
 
/* class ram;
rand bit [3:0]data; // Randomized variable used for coverage sampling
covergroup cov (); // Covergroup declaration

single_value :coverpoint data {bins b1 = (1=>2);} // Coverpoint definition
seqounce_off_bins :coverpoint  data {bins b1= (2=>3=>4=>5);} // Coverpoint definition
set_off_bits:coverpoint data {bins b1=(1,2=>3,4);} // Coverpoint definition
repetation : coverpoint data {bins b1 = (7[*2]);} // Coverpoint definition
non_consecutive : coverpoint data {bins b1 = (2[=3]=>5);} // Coverpoint definition
goto:coverpoint data {bins b1 = (1[->2]=>9);} // Coverpoint definition
ignore: coverpoint data {ignore_bins b1 = {11,12,13}; // Coverpoint definition
                         illegal_bins b2 = {14,15};} // Coverage bin definition
endgroup
function new();
cov=new();
endfunction
endclass
module rakesh;
  ram pkt = new();
  initial begin
    repeat (200) begin
      void'(pkt.randomize());
      pkt.cov.sample();
    end
	$display("covrage = %0.2f%%",pkt.cov.get_coverage());
 end
endmodule
 */


class explicit; // Class for randomized stimulus and coverage model
rand bit[2:0]a; // Randomized variable used for coverage sampling
rand bit[2:0]b; // Randomized variable used for coverage sampling
rand bit[2:0]c; // Randomized variable used for coverage sampling
 constraint ww{a inside{1,2,3,4};} // Constraint limits legal random values
constraint xx{b inside{1,2,3,4};} // Constraint limits legal random values
constraint zz{c inside{1,2,3,4};}    // Constraint limits legal random values
endclass

module rakesh;
bit clk;
explicit p1 =new();
covergroup cg @(posedge clk); // Covergroup declaration
option.goal=50; // Covergroup option configuration
option.weight=10; // Covergroup option configuration
option.name="rakesh"; // Covergroup option configuration
option.per_instance=0; // Covergroup option configuration
option.at_least=2; // Covergroup option configuration


 //sample coverpoints at posetive clock edges // explicit
   s1:coverpoint p1.a{bins b1[]=(1,2=>3,4);} // set off transition
                         
s2:coverpoint p1.b{illegal_bins b2 ={1,2};} // Coverpoint definition

s3:coverpoint p1.c{bins b3=(4[*2]);} // consecutive repetation

s4:coverpoint p1.a{bins b111=(2<=4[=2]=>3);} // non consicutive repetition

s5:coverpoint p1.b{bins b7=(2<=3[->2]=>2);} // goto repetition bith are same
 
//s6:coverpoint p1.c{ignore_bins b={2,3,4};}   
 /* s1:coverpoint p1.a;
s2:coverpoint p1.b; // Coverpoint definition
s3:coverpoint p1.c;    // Coverpoint definition
s2_s3:cross s1,s2; */ // Cross coverage between coverpoints

endgroup

covergroup cgr @(posedge clk); // Covergroup declaration
option.goal=70; // Covergroup option configuration
option.weight=5; // Covergroup option configuration
option.name="rakesh3"; // Covergroup option configuration
option.per_instance=1; // Covergroup option configuration
option.at_least=1; // Covergroup option configuration


   s1:coverpoint p1.a{bins b1[]=(1,2=>3,4);}  // Coverpoint definition

s3:coverpoint p1.c{bins b3=(4[*2]);} // consecutive repetation

endgroup

always #5 clk=~clk; // Clock generation for sampled covergroups
initial begin
cg p2=new();
cgr p3=new();
repeat(200)
begin
p1.randomize();
p2.sample();
p3.sample();
p2.get_inst_coverage();
$display("a=%d,b=%d,c=%d",p1.a,p1.b,p1.c);
end
end
endmodule 


 






 
