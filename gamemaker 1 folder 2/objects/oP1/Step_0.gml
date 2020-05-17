/// @description yeah
//Getting Hit
if punched {
    x += xv
}
//Knockback Direction
if xv > 0 {
    xv--   
}
else if xv < 0 {
    xv++
}
//Punch End
if xv = 0 {
    punched = false
}

vx = 0

//Move Right
if keyboard_check(ord("D")) {
    image_xscale =1
    vx+=6
}

// Move Left
if keyboard_check(ord("A")) {
    image_xscale = -1
    vx-=6
}

vx+=xv

if !place_meeting(x+vx, y, oWall) {
  x+=vx
} else {
   while( !place_meeting(x+sign(vx),y,oWall) )
     x+=sign(vx)  
}

///Y Direction

//Gravity
if !place_meeting(x, y+vy, oGrass) {
    vy+= grv
} else {
    vy=0
}

//Jump Reset
if place_meeting(x, y+1, oGrass) {
    jump = true
    doublejump = true        
}

//Jump off Ground
if keyboard_check_pressed(ord("W")) {
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

//Fall
if !place_meeting(x, y+vy, oGrass) {
    if keyboard_check(ord("S")) {
        y+=vy+10
    }
    else {
        y+=vy
    }
}

else {
    while(!place_meeting(x, y+sign(vy), oGrass)) {
        y+=sign(vy)
    }
    vy = 0
}



//Bump Head
if place_meeting(x, y-4, oWall) {
    vy = 0 
}

if place_meeting(x, y-4, oPlatform) {
	vy -= 4
}

if place_meeting(x, y, oWall) {
	y-=4
}

///Punch
if keyboard_check(vk_space) {
    sprite_index = sP1Punch
    P1Punch = true
}

if P1Punch {
    if place_meeting(x, y, oP2) {
    global.P2Percent +=10
        if image_xscale = 1 {
            with oP2 { 
                xv = 10 + (global.P2Percent*.1)
                punched = true
            }
        }else if image_xscale = -1{
                with oP2 {
                    xv = -10 -(global.P2Percent*.1)
                    punched = true
                }
        }
    }
}

