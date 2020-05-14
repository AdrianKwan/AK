///X
xspeed = 0
if keyboard_check(vk_left) {
	xspeed -= 6;
	image_xscale = 1;
}
if keyboard_check(vk_right) {
	xspeed += 6;
	image_xscale = -1;
}
if !place_meeting(x + xspeed, y, oWall) {
	x += xspeed;
} else {
	while(!place_meeting(x+sign(xspeed), y, oWall)) {
		x += sign(xspeed);
	}
}
///Y
if !place_meeting(x, y + yspeed, oWall) {
	yspeed += grv;	
} else {
	yspeed = 0;
	double = 2;
}

if !place_meeting(x, y+yspeed, oWall) {
	y += yspeed;
} else {
	while(!place_meeting(x, y+1,oWall)) {
		y += 1
	}
	yspeed = 0;
}
//Jump
if keyboard_check(vk_up) && jumpDelay = 0 {
	if double > 0 {
		if yspeed > 7.5 {
			yspeed -= 26;
			double--;
			jumpDelay += 10;
		} else {
			yspeed -= 13;
			double--;
			jumpDelay += 10;
		}	
	}
} 


if jumpDelay > 0 {
	jumpDelay--;	
}

//Punch
if keyboard_check(vk_enter) && !stun && !punch {
	sprite_index = sP2Punch;
	punch = true;
	if xspeed > 0 {
		image_xscale = -1
	} else if xspeed < 0 {
		image_xscale = 1;
	}
}

if sprite_index = sP2 {
		punch = false;
		stun = false;
}

