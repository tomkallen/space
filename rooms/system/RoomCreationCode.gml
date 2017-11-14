var planetarySystem = global.spaceMap[global.starId];
var planetCount = planetarySystem[? "planetCount"];
var planets = planetarySystem[? "planetList"];

for(var i = 0; i < planetCount; i++) {
	
	var p = planets[i];	
	var current = instance_create_layer(300 + 150 * i, 360, "Instances", o_planet);
	
	switch(p[? "type"]) {
		case "Ice":
			current.sprite_index = s_planet_ice;
			break;
		case "Iron":
			current.sprite_index = s_planet_iron;
			break;
		case "Lava":
			current.sprite_index = s_planet_lava;
			break;
		case "Silicate":
			current.sprite_index = s_planet_silicate;
			break;
		case "Ocean":
			current.sprite_index = s_planet_ocean;
			break;
		case "Desert":
			current.sprite_index = s_planet_desert;
			break;
		default:
			current.sprite_index = s_planet_silicate;
			break;
	}
	
	show_debug_message(p[? "mass"]);
	with(current) {		
		image_yscale = p[? "mass"];
		image_xscale = image_yscale;
		image_angle = round(random_range(0, 360));
		name = p[? "name"];
		type = p[? "type"];
		mass = p[? "mass"];
		planetId = i;
	}	
}


