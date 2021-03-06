
randomize(); // reset seed for an every game

global.spaceMap = [];

global.player = ds_map_create();
prepareShip();


global.player[? "level"] = 1;
global.player[? "xp"] = 1;
global.player[? "credits"] = 1000;
global.player[? "ship"] = global.ship;

global.starId = 0;
global.planetId = 0;

var numberOfStars = 40;
var starCellSize = 128;
var column = 0; 
var row = 0;

for(var i = 0; i < numberOfStars; i++) {  // number of stars
	
	var name = totro(3, 5, 1);  // using random names library
	var star = ds_map_create();  // data structure map is object alike
	var planets = [];
	
	for (k = 0; k < round(random_range(0, 8)); k++) {
		var p = ds_map_create();
		var planetName = totro(2, 5, 1);
		planetName = planetName[0];
		p[? "name"] = planetName;
		p[? "type"] = choose("Ice", "Ocean", "Desert", "Lava", "Iron", "Silicate");
		p[? "mass"] = (round(random_range(25, 200))) / 100;
		planets[k] = p;
	}
	
	star[? "name"] = name[0];  // same as ds_map_add(global.spaceMap, "name", name[0])
	star[? "planetCount"] = array_length_1d(planets);  // random_range returns Real number, so round
	star[? "planetList"] = planets;	
	
	var starObject = instance_create_layer(irandom_range(16, starCellSize-16) + column*starCellSize, irandom_range(16, starCellSize-16)+row*starCellSize,"Instances", o_star);
	column++;
	if (column > 8) {
		column = 0;
		row++
	}
	
	with(starObject) {
		var visibility = random_range(.5, 1.5);
		image_xscale = visibility;
		image_yscale = image_xscale;		
		image_alpha = visibility;
		starName = name[0];
		starId = i;
	}
	
	global.spaceMap[i] = star;
}

{
	var data = global.spaceMap[0];
	var star = data[? "name"];
	var planetCount = data[? "planetCount"];
	show_debug_message("Star: " + star);
	show_debug_message("Planet Count: " + string(planetCount)); // always 'stringify' other types before consoling
}

