ship = {}
require "player"

function ship.load()
	shipActive = false
	ship = love.graphics.newImage("images/ship/shipLand.png")

end	

function update(dt)
if love.keyboard.isDown('e') and player.x < 300 and player.x > 100 and shipActive == false then
		ship = love.graphics.newImage("images/ship/shipLandPlayer.png")
		player.playerExists = false
		shipActive = true
		love.timer.sleep(1)
elseif love.keyboard.isDown('e') and shipActive == true then
	ship = love.graphics.newImage("images/ship/shipLand.png")
		player.x = 100
		player.playerExists = true
		shipActive = false
		love.timer.sleep(1)
end
end

function draw()

	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(ship, 50 , 350, 0, 7, 7)

end

function UPDATE_SHIP(dt)

	update(dt)

end

function DRAW_SHIP()
		draw()
end