var right_key = keyboard_check(vk_right);
var left_key = keyboard_check(vk_left);
var up_key = keyboard_check(vk_up);
var down_key = keyboard_check(vk_down);

x_spd = (right_key - left_key) * move_spd;
y_spd = (down_key - up_key) * move_spd;



//Set sprite
if y_spd == 0 {
	if x_spd > 0 {face = RIGHT}
	if x_spd < 0 {face = LEFT}
}

if x_spd > 0 and face == LEFT {face = RIGHT}
if x_spd < 0 and face == RIGHT {face = LEFT}



if x_spd == 0 {
	if y_spd > 0 {face = DOWN}
	if y_spd < 0 {face = UP}
}

if y_spd > 0 and face == UP {face = DOWN}
if y_spd < 0 and face == DOWN {face = UP}
sprite_index = sprite[face]


//Collisionns
if place_meeting(x + x_spd, y, obj_wall) == true{
	x_spd = 0;
}
if place_meeting(x, y + y_spd, obj_wall) == true{
	y_spd = 0;
}

//Move player
x += x_spd;
y += y_spd;



//Animate
if x_spd == 0 and y_spd == 0 {image_index = 0}