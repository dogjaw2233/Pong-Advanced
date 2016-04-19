function love.load()
-- Collision detection function.
-- Returns true if two boxes overlap, false if they don't
-- x1,y1 are the left-top coords of the first box, while w1,h1 are its width and height
-- x2,y2,w2 & h2 are the same, but for the second box
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
DOSVGA = love.graphics.newFont("DOSVGA.ttf", 15)
hero = {}
hero.x = 25
hero.y = 255
hero.speed = 300
hero.dir = "left"
hero.l = 20
hero.h = 80
hero.score = 0
villain = {}
villain.x = 775
villain.y = 255
villain.speed = 300
villain.score = 0
villain.dir = "left"
villain.l = 20
villain.h = 80
slash = {}
slash.time = 5
slash.set = "false"
slash.x = 0
slash.y = 0
slash.lx = 0
slash.ly = 0
slash.dir = "left"
slash.speed = 100
slash.hit = ("false") 
ball = {}
ball.speed = 200
ball.x = 200
ball.rot = 3
ball.y = 300
ball.dir = "left"
ball.h = 10
oOoOoOo = false
ball.w = 10
ball.turn = "up"
loctest = "false"
mousex = love.mouse.getX()
mousey = love.mouse.getY()
end

function love.update(dt)

if ball.x >= 800 then
	hero.score = hero.score+1
elseif ball.x <= 0 then
	villain.score = villain.score+1
end

if ball.y >=590 then
	ball.rot = ball.rot / -1
elseif ball.y <= 0 then
	ball.rot = ball.rot / -1
end

if ball.dir == "left" then
	ball.x = ball.x + ball.speed*dt
elseif ball.dir == "right" then
	ball.x = ball.x - ball.speed*dt
end

ball.y = ball.y + ball.rot*dt

mousex = love.mouse.getX()
mousey = love.mouse.getY()

if love.keyboard.isDown("f") then
	loctest = "true"
end

if CheckCollision(hero.x, hero.y, hero.l, hero.h, ball.x, ball.y, ball.w, ball.h) then
	ball.dir = "left"
	ball.speed = ball.speed * 1.05
	ball.rot = love.math.random(ball.rot-150, ball.rot+150)
end
if love.keyboard.isDown("a") then
	if (hero.x) >= 0 then
		hero.x = hero.x - hero.speed*dt
		hero.dir = "left"
	end
	if slash.set == "false" then
		slash.dir = "left"
		slash.lx = hero.x
		slash.ly = hero.y
	end
elseif love.keyboard.isDown("d") then
	if (hero.x + hero.l) <= 200 then
		hero.x = hero.x + hero.speed*dt
		hero.dir = "right"
	end
end
if love.keyboard.isDown("w") then
	hero.y = hero.y - hero.speed*dt
elseif love.keyboard.isDown("s") then
	hero.y = hero.y + hero.speed*dt
end

if CheckCollision(villain.x, villain.y, villain.l, villain.h, ball.x, ball.y, ball.w, ball.h) then
	ball.dir = "right"
	ball.speed = ball.speed * 1.05
	ball.rot = love.math.random(ball.rot-150, ball.rot+150)
end
if love.keyboard.isDown("left") then
	if (villain.x + villain.l) >= 600 then
		villain.x = villain.x - villain.speed*dt
		villain.dir = "left"
	end
	if slash.set == "false" then
		slash.dir = "left"
		slash.lx = villain.x
		slash.ly = villain.y
	end
elseif love.keyboard.isDown("right") then
	if (villain.x + villain.l) <= 800 then
		villain.x = villain.x +villain.speed*dt
		villain.dir = "right"
	end
end
if love.keyboard.isDown("up") then
	villain.y = villain.y - villain.speed*dt
elseif love.keyboard.isDown("down") then
	villain.y = villain.y + villain.speed*dt
end

if love.keyboard.isDown("z") then
	if slash.set == "false" then
		slash.set = "true"
	end
end
if slash.set == "true" then
	if slash.x <= slash.lx - 50 then
		slash.set = false
	end
end

if slash.set == "false" then
	slash.x = slash.lx
	slash.y = slash.ly
elseif slash.set == "true" then
	if slash.dir == "left" then
		slash.x = slash.x - slash.speed*dt
	end
end
end

function love.draw()
love.graphics.setFont(DOSVGA, 14)
love.graphics.print(hero.score, 300, 200, 0, 3)

love.graphics.setColor(0,255,0,255)
love.graphics.rectangle("fill", 0, 465, 1, 1)

love.graphics.setColor(255,255,0,255)
love.graphics.rectangle("fill", hero.x, hero.y, hero.l, hero.h)

love.graphics.setColor(255,255,0,255)
love.graphics.rectangle("fill", villain.x, villain.y, villain.l, villain.h)

love.graphics.setColor(0,255,0,255)
love.graphics.rectangle("fill",ball.x,ball.y,ball.w,ball.h)

if loctest == "true" then
	love.graphics.print(mousex, 300, 200)
	love.graphics.print(mousey, 300, 300)
end

if oOoOoOo == true then
	love.graphics.print("oOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoO",900,900)
end

if slash.set == "true" then
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.rectangle("fill", slash.x, slash.y, 2, 2)
end
end