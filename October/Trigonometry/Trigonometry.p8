pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- used a tutorial by lexaloffle
-- for the bullet spawning to learn
-- about tables in lua with pico-8

function _init()
	x = 64
	y = 64
	speed = 0
	angle = 0
	
	objs = {}
	
	e_x = 100
	e_y = 100
	e_speed = 1
	e_angle = 0
end
 
function _update()
	if btn(0) then -- left
		angle += 0.01
		x -= 1
	end
	
	if btn(1) then -- right
		angle -= 0.01
		x += 1
	end
	
	if btn(2) then -- up
		y -= 1 
	end
	
	if btn (3) then -- down
		y += 1
	end
	
	-- apply to the x and y for
	-- the player
	x += cos(angle) * speed
	y += sin(angle) * speed
	
	-- calculate the difference
	-- between angles
	dif_x = x - e_x
	dif_y = y - e_y
	
	-- set the enemy angle
	e_angle = atan2(dif_x, dif_y)
	
	-- apply to the x and y for
	-- the enemy
	e_x += cos(e_angle) * e_speed
	e_y += sin(e_angle) * e_speed
	
 if(btnp(4)) _newbullet(x,y,4,4,2,0)
 local i,j=1,1               --to properly support objects being deleted, can't use del() or deli()
 while(objs[i]) do           --if we used a for loop, adding new objects in object updates would break
  if objs[i]:update() then
   if(i!=j) objs[j]=objs[i] objs[i]=nil --shift objects if necessary
   j+=1
  else objs[i]=nil end       --remove objects that have died or timed out
  i+=1                       --go to the next object (including just added objects)
 end
end

function _drawobject(o)
	spr(o.spr, o.x, o.y)
end

function _bulletupdate(b)
	b.x += b.dx
	b.y += b.dy
	b.time -= 1
	return b.time > 0
end

function _newbullet(x,y,w,h,dx,dy)
	local b = 
	{
		x = x, y = y, dx = dx, dy = dy,
		w = w, h = h,
		time = 60,
		update = _bulletupdate,
		spr = 3, draw = _drawobject 
	}
	add(objs, b)
	return b
end

function _draw()	
	cls() -- clear the screen
	spr(1, x, y) -- draw player
	spr(2, e_x, e_y) -- draw enemy

	for o in all(objs) do o:draw() end
end
__gfx__
00000000008888002222222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008eeee802eeeeee200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007008eeeeee82eeeeee200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770008eeeeee82eeeeee200099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770008eeeeee82eeeeee200099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007008eeeeee82eeeeee200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008eeee802eeeeee200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008888002222222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
