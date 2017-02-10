#define true 1
#define false 0
#include "msg\common.hpp"
#include "msg\msg.hpp"
class Message_Settings {
//overlap = true; // TRUE -> simpl messages can be overlapped
/*Stuff you can edit on your own*/
noBar = false; // TRUE -> colorbar not visible in simple messages
sound = "Hint"; // Here you can change the normal message sound with the name of your sound class
soundSec = "Hint"; // Here you can change the simple message sound with the name of your sound class
noSound = false; // TRUE -> disables the sound on normal messages
noSoundSec = true; // TRUE -> disables the sound on simple messages
rscLayer = 20; // 20 -> the layer on hud the dialog will create
kindOfCutRsc = "PLAIN"; // "PLAIN" -> the kind of CutRsc
fadein = 0.2; // 0.2 -> The fadein duration | default hint could be 0
baseTitel = "Notification"; // The standart text for the case that no titel param is given
baseColor = "lightblue"; // The standart color for the case that no color param is given
};
class Colors 
{
	/*Example:
	define class as name of your color
	class nameOfColour {
	rgba[] = { x, x, x, 0.7 }; Important is that you ceep the last number in this array at 0.7, these is the alpha channel
	};Replace X with numbers
	*/
	//Colors for colorbar
	class red 
	{
		rgba[] = { 0.92, 0, 0.51, 0.7 };
	};
	
	class orange 
	{
		rgba[] = { 0.92, 0.51, 0, 0.7 };
	};
	
	class yellow 
	{
		rgba[] = { 0.96, 0.9, 0, 0.7 };
	};
	
	class green 
	{
		rgba[] = { 0.16, 0.95, 0, 0.7 };
	};
	
	class turquoise 
	{
		rgba[] = { 0.79, 0, 0, 0.7 };
	};
	
	class lightblue 
	{
		rgba[] = { 0, 0.49, 0.8, 0.7 };
	};
	
	class blue 
	{
		rgba[] = { 0, 0.11, 0.74, 0.7 };
	};
	
	class darkblue 
	{
		rgba[] = { 0.05, 0.03, 0.38, 0.7 };
	};
	
	class purple 
	{
		rgba[] = { 0.37, 0.06, 0.56, 0.7 };
	};
	
	class pink 
	{
		rgba[] = { 0.7, 0.22, 0.46, 0.7 };
	};
	
	class white 
	{
		rgba[] = { 1, 1, 1, 0.7 };
	};
};