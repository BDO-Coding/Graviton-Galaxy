ship = {}
require "player"
require "images"

function ship.load()

	shipActive = false
	ship = images.ship
	rampx = 350
	rampy = 550
	shipxvel = 1
	shipyvel = 1
	animation4 = true
	animation1 = false
    animation2 = false
    animation3 = false
    playerOverShip = false
    smokeActive = false
    shipx = 50
    shipy = 350
	liftoff = false
	speed = 1250

	local smoke = images.smoke
	local fire = images.fire

 
	psystem1 = love.graphics.newParticleSystem(smoke, 64)
	psystem1:setParticleLifetime(2, 5) -- Particles live at least 2s and at most 5s.
	psystem1:setEmissionRate(2000)
	psystem1:setSizeVariation(1)
	psystem1:setLinearAcceleration(-20, -20, 20, 20) -- Random movement in all directions.
	psystem1:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to transparency.

	psystem2 = love.graphics.newParticleSystem(fire, 100)
	psystem2:setParticleLifetime(2, 2) -- Particles live at least 2s and at most 5s.
	psystem2:setEmissionRate(20)
	psystem2:setSizeVariation(0)
	psystem2:setLinearAcceleration(-20, -1, -20, 1) -- Random movement in all directions.
	psystem2:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to transparency.


end	

function update(dt)

	n = 0
	if love.keyboard.isDown('e') and player.x < 400 and player.x > 100 and player.y > 400 and shipActive == false then
		player.canMove = false
		 player.x = 350
		 player.hero = player.rightPlayer
	     animation1 = true
	elseif love.keyboard.isDown('e') and shipActive == true then
		ship = images.ship

		player.x = 100
		player.playerExists = true
		player.doGravity = true
		smokeActive = false
		shipActive = false
		playerOverShip = false
		love.timer.sleep(0.1)
		rampx = 350
		rampy = 550
	    shipx = 50
  	    shipy = 350
    	liftoff = false
	end

	if love.keyboard.isDown('space') and smokeActive == true then
		liftoff = true
		shipActive = false
		smokeActive = false
	end

end

function draw()

	love.graphics.setColor(255, 255, 255)

	if player.onPlanet == true then
		love.graphics.draw(ship, shipx, shipy, 0, 7, 7)
	elseif player.onPlanet == false then
		love.graphics.draw(ship, shipx, shipy, 0, 1, 1)
	end
	
	if shipActive == true then

		love.graphics.setColor(0, 0, 0,255)
	    love.graphics.line(350,550,rampx,rampy)
	end

	if liftoff == true then
		love.graphics.draw(psystem2,shipx+160,shipy+140)
  	    love.graphics.draw(psystem2,shipx+160,shipy+145)
  	    ship = images.playerInShipNoGear
	end

	if smokeActive == true then
		-- Draw the particle system at the center of the game window.
		love.graphics.draw(psystem1,shipx+170,shipy+140)
		love.graphics.draw(psystem1,shipx+150,shipy+140)
    	love.graphics.setColor(200, 80, 80)
		love.graphics.print("Press SPACE to start the Engine", shipx , shipy - 50, 0, 3, 3)
	end

end

function playerIntoShip() --Animations for player getting into ship

	if animation1 == true then
		player.x = player.x + 0.5
		if player.x > 450 then			   
		 	animation1 = false
		   	animation2 = true
		    shipActive = true
		end
	end

	if animation2 == true then
		playerOverShip = true
		player.x = player.x - 0.5
		if player.x < 350 then
		    animation2 = false
    		animation4 = true
		    animation3 = true
  		end
	end

	if animation3 == true then
		player.doGravity = false
		player.x = player.x - 0.5
		player.y = player.y - 5
		if player.x < 300 then
	   		player.canMove = true
			player.playerExists = false
		   	ship = images.playerInShip
		   	animation3 = false
		   	smokeActive = true
	    end
	end

end

function liftOff()

	if liftoff == true then
		shipy = shipy - 3
		shipx = shipx + 1
	end
	if shipy < 0 and player.onPlanet == true then
		liftoff = false
		player.onPlanet = false
		ship = images.shipInSpace
		shipy = 600
		shipx = 500
	end
	
end

function shipPhysics()

	if player.onPlanet == false then
		shipx = shipx + xvel
		shipy = shipy + yvel
	end

end

function shipMovement(dt)

	if player.onPlanet == false then
		if love.keyboard.isDown('d') and player.dead == false then
			shipxvel = shipxvel + speed * dt
		end

		if love.keyboard.isDown('a') and player.dead == false then
			shipxvel = shipxvel - speed * dt
		end

		if love.keyboard.isDown('w') and player.dead == false then
			shipyvel = shipyvel - speed * dt
		end

		if love.keyboard.isDown('s') and player.dead == false then
			shipyvel = shipyvel + speed * dt
		end
	end

end

function UPDATE_SHIP(dt)
	
	psystem1:update(dt)
	psystem2:update(dt)
	update(dt)
	playerIntoShip()
	liftOff()
	shipPhysics(dt)
	shipMovement(dt)
	if shipActive == true then
	--if animation4 == true then
		rampx = rampx + 0.25
		rampy = rampy + 0.25
	 --end
	    if rampy > 589 and rampx > 389 then
		    rampy = 590
		    rampx = 390
	    end
	end

end

function DRAW_SHIP()

	draw()

end