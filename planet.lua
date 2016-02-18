planet = {}

function planet.load()

	planet.gravity = 0
	planet.colourR = love.math.random(0, 255) 
	planet.colourG = love.math.random(0, 255) 
	planet.colourB = love.math.random(0, 255) 
	planet.backColourR = love.math.random(0, 255) 
	planet.backColourG = love.math.random(0, 255) 
	planet.backColourB = love.math.random(0, 255) 
	planet.gravity = love.math.random(10, 200)
	planet.groundlevel = 600

end

function planet.draw()

	love.graphics.setBackgroundColor(planet.backColourR, planet.backColourG, planet.backColourB)

end

function UPDATE_PLANET(dt)

end

function DRAW_PLANET()

	planet.draw()

end