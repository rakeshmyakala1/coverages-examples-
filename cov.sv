1) cover all values of a ramndom variable b/w 0 and 100
 
 class ram;
  randc bit [6:0] a; // 7-bit to cover values 0–100
  covergroup cov;
    cp1: coverpoint a { bins b[] = {[0:100]}; }
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

 2 cover even and odd multiple of 10 cover inside 0:100;

  class ram;
  randc bit [6:0] a; // 7-bit to cover values 0–100
  covergroup cov();
    cp1_eve: coverpoint a { bins even_bin[] = {[0:100]} with (item %2==0);}
	cp2_odd: coverpoint a {bins odd_bin[] = {[0:100]} with (item %2 == 1);}
	cp3_mul: coverpoint a {bins mul_10[] =  {[0:100]} with (item % 10 == 0);}
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

3) cover all 52_deck card

 class ram;
  typedef enum {ACE = 0, ONE = 1, TWO = 2, THREE = 3, FOUR = 4, FIVE = 5, SIX = 6,
                SEVEN = 7, EIGHT = 8, NINE = 9, TEN = 10, JACK = 11, QUEEN = 12, KING = 13} values;
 typedef enum {HEARTS, DIAMONDS, CLUBS, SPADES}suits;
 rand values value;
 rand suits suit;
 
 covergroup cov ();
 cp_value: coverpoint value {bins bin[] = {[1:10]};
                         bins bin_2 = {ACE};
						 bins bin_3 []= {JACK,QUEEN,KING};
						 }
cp_suit: coverpoint suit {bins b_1 = {HEARTS};
                          bins b_2 = {DIAMONDS};
						  bins b_3 = {CLUBS};
						  bins b_4 = {SPADES};
						  }	
cross_vales_suit : cross cp_value,cp_suit;
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
 
 4) cover students marks bins 0_50,51_75,76_100

 class ram;
rand bit [0:6] marks;
covergroup cov();
 mark:coverpoint marks{bins low ={[0:51]};
                        bins medium_s = {[51:75]};
						bins high = {[76:100]};
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
 
  5) cover dice 1 to 6 

  class ram;
rand bit [0:2] dice;
covergroup cov();
 mark:coverpoint dice{bins vales[] ={[1:6]};
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
	 
 

6) cover trafiic light durations green (30-60) yellow (5-10) red(50-90);

 class ram;
rand bit[0:6] duration;
typedef enum {red,yellow,green} light_colors;
rand light_colors lights;
 covergroup  cov();
  cp1: coverpoint duration { bins yellow_d = {[5:10]}; 
                           bins green_d = {[30:60]};
						  bins red_d = {[50:90]};
							}
 cp2: coverpoint lights;
 cp_cross: cross cp1,cp2;
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
  
 8) cover temparature values in 4 bins
 
 class ram;
  rand int temperature;

  covergroup temp_cov;
    cp_temp: coverpoint temperature {
      bins low     = {[0:20]};
      bins normal  = {[21:35]};
      bins warning = {[36:50]};
      bins critical= {[51:100]};
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

9) cover diffrent length of burst transactions

class ram;
rand bit [7:0] length;
rand bit [1:0] burst;
covergroup cov ();
cp_fixed: coverpoint length iff(burst==00) {bins fix = {[0:15]};}
cp_incr: coverpoint length iff(burst==01) {bins incr = {[0:255]};}
cp_wrap:coverpoint length iff(burst==10) {bins wrap = {1,3,7,15};}
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

10) Cover all combinations of signal A (0/1) and signal B (0/1)


 class ram;
rand bit a,b;
covergroup cov();
  cp1:coverpoint a {bins zero ={0};
                    bins one = {1};}
cp2: coverpoint b {bins zreo = {0};
                      bins one = {1};}
cp1_cp2:cross cp1,cp2;
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
rand bit [3:0] id;
covergroup cov();
cp1:coverpoint id {bins b1[] = {[0:15]};}
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
rand bit [3:0] data;
covergroup cov();
cp1: coverpoint data iff ($countones(data)%2==0){bins b1 []= {[0:15]} ;}
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
rand bit [7:0] valid_addr;
constraint con {valid_addr inside{10,172,192};}
covergroup cov();
cp1: coverpoint valid_addr{bins  b1[] = {10,172, 192};}
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
rand bit [2:0] valid_invalid;
covergroup cov();
cp1: coverpoint valid_invalid{bins  valid [] = {0,1,2,3,4};
                                bins invalid[] = {5,6,7};}
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
rand bit [3:0]data;
covergroup cov ();

single_value :coverpoint data {bins b1 = (1=>2);}
seqounce_off_bins :coverpoint  data {bins b1= (2=>3=>4=>5);}
set_off_bits:coverpoint data {bins b1=(1,2=>3,4);}
repetation : coverpoint data {bins b1 = (7[*2]);}
non_consecutive : coverpoint data {bins b1 = (2[=3]=>5);}
goto:coverpoint data {bins b1 = (1[->2]=>9);}
ignore: coverpoint data {ignore_bins b1 = {11,12,13};
                         illegal_bins b2 = {14,15};}
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


class explicit;
rand bit[2:0]a;
rand bit[2:0]b;
rand bit[2:0]c;
 constraint ww{a inside{1,2,3,4};}
constraint xx{b inside{1,2,3,4};}
constraint zz{c inside{1,2,3,4};}   
endclass

module rakesh;
bit clk;
explicit p1 =new();
covergroup cg @(posedge clk);
option.goal=50;
option.weight=10;
option.name="rakesh";
option.per_instance=0;
option.at_least=2;


 //sample coverpoints at posetive clock edges // explicit
   s1:coverpoint p1.a{bins b1[]=(1,2=>3,4);} // set off transition
                         
s2:coverpoint p1.b{illegal_bins b2 ={1,2};}

s3:coverpoint p1.c{bins b3=(4[*2]);} // consecutive repetation

s4:coverpoint p1.a{bins b111=(2<=4[=2]=>3);} // non consicutive repetition

s5:coverpoint p1.b{bins b7=(2<=3[->2]=>2);} // goto repetition bith are same
 
//s6:coverpoint p1.c{ignore_bins b={2,3,4};}   
 /* s1:coverpoint p1.a;
s2:coverpoint p1.b;
s3:coverpoint p1.c;   
s2_s3:cross s1,s2; */

endgroup

covergroup cgr @(posedge clk);
option.goal=70;
option.weight=5;
option.name="rakesh3";
option.per_instance=1;
option.at_least=1;


   s1:coverpoint p1.a{bins b1[]=(1,2=>3,4);} 

s3:coverpoint p1.c{bins b3=(4[*2]);} // consecutive repetation

endgroup

always #5 clk=~clk;
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


 






 