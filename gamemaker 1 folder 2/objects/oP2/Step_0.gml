/// @description X Direction

//Getting Hit
if punched {
   // x += xv
}
//Knockback Direction
if xv > 0
    xv--   
else if xv < 0 
    xv++

//Punch End
if xv = 0 {
    punched = false
}


vx=0

//Move Right
if keyboard_check(vk_right) {
    image_xscale =-1
    vx+=6
}

// Move Left
if keyboard_check(vk_left) {
    image_xscale = 1
    vx-=6
}

vx+=xv


if !place_meeting(x+vx, y, oWall)
  x+=vx
else {
   while( !place_meeting(x+sign(vx),y,oWall) )
     x+=sign(vx)  
}


///Y Direction

if !place_meeting(x, y+vy, oGrass) {
    if keyboard_check(vk_down) {
        y+=vy+10
    }
    else {
        y+=vy
    }
}

if !place_meeting(x, y+1, oWall) {
    vy+= grv
}
else {
    vy=0
}
//Jump
if keyboard_check_pressed(vk_up) {
   if place_meeting(x, y+1, oGrass)  {
        vy = -10
        jump = false
        doublejump= true
    }
    //First Jump
    else if jump {
        vy=-10
        jump = false
    }
    //Second Jump
    else if doublejump {
        vy=-10
        doublejump = false
    }
}

if !place_meeting(x, y+vy, oWall) {
    y+=vy
    
} 
else {
    while(!place_meeting(x, y+sign(vy), oWall)) {
        y+=sign(vy)
    }
    vy = 0  
}

if place_meeting(x, y-4, oPlatform) {
	vy -= 4
}

if place_meeting(x, y, oWall) {
	y-=4
}


///Punch
if keyboard_check(ord("O")) {
    sprite_index = sP2Punch
    P2Punch = true
}

if P2Punch {
    if place_meeting(x, y, oP1) {
        global.P1Percent += 10
        if image_xscale = -1 {
            with oP1 { 
                xv = 10 + (global.P1Percent*.1)
                punched = true
            }
        }else if image_xscale = 1{
                with oP1 {
                    xv = -10 - (global.P1Percent*.1)
                    punched = true
                }
        }
    }
}

