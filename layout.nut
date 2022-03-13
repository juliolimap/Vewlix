
local orderx = 0;
local divider = "----"

class UserConfig {
	
 
     
	
		</ label="Ativar listbox", help=" ", options="wheel,list-box",  per_display	= true, order=orderx++ /> enable_listbox="wheel";
	
	
	
  </ label="Imagem/Video de fundo", help="", options="Statico Arcade,Video Arcade,Video Smooke",per_display	= true, order=orderx++ /> enable_image="Statico Arcade";   

	</ label="Ativar animações de inicialização", help="Enable system animation when layout starts", 
		options="Yes,No",per_display	= true, order=orderx++ /> enable_ini_anim="Yes";
	</ label="Transparencia List-box", 
		help=" ", 
		options="500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000",per_display= true,
		order=orderx++
		/>ini_anim_trans_ms="1000";
	 
}  

local my_config = fe.get_config();

// modules
fe.load_module("animate");
fe.load_module("fade");
fe.load_module("file");
fe.load_module("file-format");
fe.load_module("conveyor");
fe.load_module("animate2");
fe.do_nut( fe.script_dir + "nuts/shuffle.nut");
fe.do_nut( fe.script_dir + "nuts/scrollingtext.nut");
fe.load_module( "animate" );
fe.load_module( "pan-and-scan" );
fe.load_module( "fade" );
fe.load_module("shuffle");





local ini_anim_time;
try { ini_anim_time =  my_config["ini_anim_trans_ms"].tointeger(); } catch ( e ) { }

// Letters ini
local rtime = 0;
local glob_time = 0;
local glob_delay;
try { glob_delay =  my_config["set_ms_delay"].tointeger(); } catch ( e ) { }
if( glob_delay > 750 )
	glob_delay = 750;


local settings = {
   "default": { 
   //16x9 is default
      aspectDepend = { 
        res_x = 2133,
        res_y = 1200,
        maskFactor = 1.9}
   },
   "16x10": {
      aspectDepend = { 
        res_x = 1920,
        res_y = 1200,
        maskFactor = 1.9}
   },
    "16x9": {
      aspectDepend = { 
        res_x = 1920,
        res_y = 1080,
        maskFactor = 1.9}
   },
   "4x3": {
      aspectDepend = { 
        res_x = 1600,
        res_y = 1200,
        maskFactor = 1.6}
   }
   "5x4": {
      aspectDepend = { 
        res_x = 1500,
        res_y = 1200,
        maskFactor = 1.6}
   }
}

local aspect = fe.layout.width / fe.layout.height.tofloat();
local aspect_name = "";
switch( aspect.tostring() )
{
    case "1.77865":  //for 1366x768 screen
    case "1.77778":  //for any other 16x9 resolution
        aspect_name = "16x9";
        break;
    case "1.6":
        aspect_name = "16x10";
        break;
    case "1.33333":
        aspect_name = "4x3";
        break;
    case "1.25":
        aspect_name = "5x4";
        break;
    case "0.75":
        aspect_name = "3x4";
        break;
}


function Setting( id, name )
{
    if( aspect_name in settings && id in settings[aspect_name] && name in settings[aspect_name][id] )
  {
    ::print("\tusing settings[" + aspect_name + "][" + id + "][" + name + "] : " + settings[aspect_name][id][name] + "\n" );
    return settings[aspect_name][id][name];
  } else if( aspect_name in settings == false )
  {
    ::print("\tsettings[" + aspect_name + "] does not exist\n");
  } else if( name in settings[aspect_name][id] == false )
  {
    ::print("\tsettings[" + aspect_name + "][" + id + "][" + name + "] does not exist\n");
  }
  ::print("\t\tusing default value: " + settings["default"][id][name] + "\n" );
  return settings["default"][id][name];
}

fe.layout.width = Setting("aspectDepend", "res_x");
fe.layout.height = Setting("aspectDepend", "res_y");

local flx = fe.layout.width;
local fly = fe.layout.height;
local flw = fe.layout.width;
local flh = fe.layout.height;

local mask_factor = Setting("aspectDepend", "maskFactor");

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////














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






 
fe.load_module("shuffle");	

local ini_anim_time;
try { ini_anim_time =  my_config["ini_anim_trans_ms"].tointeger(); } catch ( e ) { }
	 
 
 

//Statico Arcade,Animado Arcade,Smooke
if( my_config["enable_image"] == "Statico Arcade" ) {
	local bg = fe.add_image( fe.script_dir+"video/static.jpeg", 0, 0, flw, flh );
}
 
 
 
if( my_config["enable_image"] == "Video Arcade" ){
local bg = fe.add_image( fe.script_dir+"video/bkg_anim.flv", 0, 0, flw, flh );
}
if( my_config["enable_image"] == "Video Smooke" ){
	local bg = fe.add_image( fe.script_dir+"video/smooke.flv", 0, 0, flw, flh );
}


local sombra = fe.add_image( fe.script_dir+"imagem/sombra.png", flx/1.8, fly*0.035,flw*0.435, flh/1.3 );
sombra.alpha = ini_anim_time;
//fe.add_image( fe.script_dir+"imagem/listbox.png", flx/1.8, fly*0.035,flw*0.435, flh/1.3 );


  
local black = fe.add_image( "imagem/black.png", flx*0.0895, fly*0.04, flw*0.400, flh*0.13 );  
 

local snap = fe.add_artwork("fanart", flx*0.090, fly*0.270, flw*0.398, flh*0.43 );
 
  
 
 
 
local video = fe.add_artwork( "video", flx*0.090, fly*0.270, flw*0.398, flh*0.43 );
 

local marquee = fe.add_artwork( "wheel", flx*0.0895, fly*0.04, flw*0.400, flh*0.13 ); 
marquee.preserve_aspect_ratio = true; 


local bgArt = fe.add_image("imagem/cabinets.png", 0, 0, flw*0.600, flh  );
  







// add Free play text
local free = fe.add_text( "[FICHA]", flx*0.563, fly*0.573, flw*0.15, flh*0.40);
free.set_rgb(0,0,0);
free.font = "tahomabd";
free.align = Align.Centre
free.charsize = 55;
local free = fe.add_text( "[FICHA]", flx*0.56, fly*0.573, flw*0.15, flh*0.40);
free.set_rgb(255,210,0)
free.font = "tahomabd";
free.align = Align.Centre
free.charsize = 55;
 






 

 








/////////////////////////////snap ////////////////////   
local move_bgArt = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = fly*0.30, tween = "cubic", time = 1500
}
animation.add( PropertyAnimation(snap, move_bgArt ) );

/////////////////////////////video ////////////////////   
local move_bgArt2 = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = fly*0.30, tween = "cubic", time = 1500
}
animation.add( PropertyAnimation(video, move_bgArt2 ) );

////////////////////marquee /////////////////////////////  
local move_bgArt3 = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = fly*0.04, tween = "cubic", time = 1500,
}
 

 animation.add( PropertyAnimation( marquee , move_bgArt3 ) ); 





////////////////////marquee /////////////////////////////  
local move_bgArt4 = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = fly*0.04, tween = "cubic", time = 1500
}
 animation.add( PropertyAnimation(  black , move_bgArt4 ) );  
 
  

//////////////////////////////monitor ///////////////////
local move_bgArt1 = {
when = Transition.StartLayout, property = "y", start = flx*-1.555, end = flx*0.0, tween = "cubic", time = 1500
}
animation.add( PropertyAnimation( bgArt, move_bgArt1 ) );


  
 



 


 

	
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
fe.do_nut( fe.script_dir + "nuts/scrollingtext.nut");
ScrollingText.debug = false;

  

local scroller1 = ScrollingText.add( "[ListEntry] .  [Title]", 0, 0, flw*0.40, flh*0.140, ScrollType.HORIZONTAL_LEFT );
    scroller1.set_bg_rgb(200, 0, 200);
    scroller1.set_rgb( 255, 255, 0 );
    scroller1.text.charsize = 37;
	scroller1.text.alpha = alpha;		
	scroller1.text.font = "tahomabd"; 
	
	
//////////////////////////scrollingtext fim ///////////////////////////
	
	
	
	
local divisor = flx/1.7
  
  fe.do_nut( fe.script_dir + "nuts/shuffle.nut");
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



  
  
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////// aqui começa a lambança          ///////////////////////// 
 	
 	
 	
 	
 	
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
else
 
list[i].visible=true;  
 
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

local img_gif = "gif/select.gif";

local pow = [];
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.070, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.122, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.175, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.230, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.282, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.335, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.383, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.443, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.497, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.550, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.603, flw*0.41, flh*0.057));
pow.push(fe.add_image(img_gif,flx*0.57, fly*0.658, flw*0.41, flh*0.057));

	
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
