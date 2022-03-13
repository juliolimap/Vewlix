


fe.load_module("shuffle");

local flx = fe.layout.width; 
local fly = fe.layout.height; 
local flw = fe.layout.width; 
local flh = fe.layout.height;




//font size
local font_size =20;
local alpha0 = 0;
local alpha = 255;


 local set_sel_rgb= (255,243, 20); 
//font color
local R = 230;
local G = 230;
local B = 230;
local space = 20; 

//alpha
local alpf =  2000;




 

	
	
	


class ShufflePow extends Shuffle
 {
	 function select(slot) 
	{
       
 
	slot.visible = true;
	}
	
	function deselect(slot) 
 {
	slot.visible = false;
	}

}


 
 
//////////////////////////scrollingtext///////////////////////////
fe.do_nut( fe.script_dir + "modules/scrollingtext.nut");
ScrollingText.debug = false;

  

local scroller1 = ScrollingText.add( "[ListEntry] .  [Title]", 0, 0, flw*0.40, flh*0.140, ScrollType.HORIZONTAL_LEFT );
    scroller1.set_bg_rgb(200, 0, 200);
    scroller1.set_rgb( 255, 255, 0 );
    scroller1.text.charsize = 37;
	scroller1.text.alpha = alpha;		
	scroller1.text.font = "tahomabd"; 
	
	
//////////////////////////scrollingtext fim ///////////////////////////
	
	
	
	
local divisor = flx/1.7
  
  fe.do_nut( fe.script_dir + "modules/shuffle.nut");
local list = [];
  	
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.028, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.080, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.132, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.188, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.240, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.293, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.340, flw*0.40, flh*0.140)); // 7
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57  fly*0.400, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.454, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.506, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.560, flw*0.40, flh*0.140));
list.push(fe.add_text("[ListEntry] .  [Title]", flx*0.57, fly*0.615, flw*0.40, flh*0.140));
class ShuffleList extends Shuffle
{
function _refreshSelected(slot) 
{
slot.set_rgb (255, 255, 0);
slot.font="tahomabd";		
slot.charsize = 37;
slot.align = Align.Left;	
scroller1.set_pos(-100, -100, 0, 0);
for( local i=0; i<12; i++ ) 
list[i].visible=true;     



  
local first_char = rstrip(fe.game_info(Info.Title)).slice(0,40);  
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////// aqui começa a lambança          ///////////////////////// 
 	
 	
if (fe.game_info(Info.Title)  != first_char ) { 	
 	
 	
for( local i=0; i<12; i++ )                                                //conta de 0 a 12





if (list[i]  == slot) {                                                    //se o slot selecionado for igual a algum slot  
print ( "--------------------- SLOT " +i+ "\n" );                          //mostra numero do slot     
  
 if (i == 0){scroller1.set_pos(flx*0.57, fly*0.028, flw*0.40, flh*0.140);}  //se o numero (i) for igual ao slot zero muda a posiçao do scrollingtext 
 if (i == 1){scroller1.set_pos(flx*0.57, fly*0.080, flw*0.40, flh*0.140);}  //                          ||
 if (i == 2){scroller1.set_pos(flx*0.57, fly*0.132, flw*0.40, flh*0.140);}  //                          ||         
 if (i == 3){scroller1.set_pos(flx*0.57, fly*0.188, flw*0.40, flh*0.140);}  //                          ||
 if (i == 4){scroller1.set_pos(flx*0.57, fly*0.240, flw*0.40, flh*0.140);}  //                          ||
 if (i == 5){scroller1.set_pos(flx*0.57, fly*0.293, flw*0.40, flh*0.140);}  //                          ||
 if (i == 6){scroller1.set_pos(flx*0.57, fly*0.340, flw*0.40, flh*0.140);}  //                          ||
 if (i == 7){scroller1.set_pos(flx*0.57, fly*0.400, flw*0.40, flh*0.140);}  //                          ||
 if (i == 8){scroller1.set_pos(flx*0.57, fly*0.454, flw*0.40, flh*0.140);}  //                          ||
 if (i == 9){scroller1.set_pos(flx*0.57, fly*0.506, flw*0.40, flh*0.140);}  //                          ||
 if (i == 10){scroller1.set_pos(flx*0.57, fly*0.560, flw*0.40, flh*0.140);} //                          ||
 if (i == 11){scroller1.set_pos(flx*0.57, fly*0.615, flw*0.40, flh*0.140);} //                          ||
  
list[i].visible=false;   
  
 
}

                                                   
}                                                                         
else
scroller1.set_pos(-100, -100, 0, 0);

 
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////// aqui termina a lambança          ////////////////////////   


 
 
 

	
}




function _refreshDeselected(slot) 
{	
slot.set_rgb (192,192,192);
slot.font="tahomabd";		
slot.charsize = 37;
 slot.align = Align.Left;	  
}
}
local list = ShuffleList({slots=list, reset=false});


//--------------------------------------------------------------------------------------------
//----------------------------- Slot Gif -----------------------------------------------------
//--------------------------------------------------------------------------------------------
local pow = [];
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.070, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.122, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.175, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.230, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.282, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.335, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.383, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.443, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.497, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.550, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.603, flw*0.41, flh*0.057));
pow.push(fe.add_image("pointers/select.gif",flx*0.57, fly*0.658, flw*0.41, flh*0.057));

	
class ShufflePow extends Shuffle
{
function _refreshSelected(slot)
{
slot.visible = true;
}
function _refreshDeselected(slot)
{
slot.visible = false;
}
}












local pow = ShufflePow({slots=pow, reset=false});



	 
		 






