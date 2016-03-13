images = {}

function images.load()

	--↓ Player images 
	images.playerIdle 	= love.graphics.newImage("images/player/playerIdle.png") 		-- Still player
	images.playerDead 	= love.graphics.newImage("images/player/playerDead.png") 		-- Dead player
	images.playerSpace 	= love.graphics.newImage("images/player/playerIdleSpace.png") 	-- Player in space
	images.playerLeft 	= love.graphics.newImage("images/player/playerWalkingLeft.png")	-- Player moving left
	images.playerRight 	= love.graphics.newImage("images/player/playerWalkingRight.png") --Player moving right

	--↓ Ship images
	images.ship 		= love.graphics.newImage("images/ship/shipLand.png")			--Ship without player inside
	images.playerInShip	= love.graphics.newImage("images/ship/shipLandPlayer.png")		--Ship with player inside

	--↓ Monster images
	images.darkElf 		= love.graphics.newImage("images/monster/darkElf.png")			--Dark elf monster

	--↓ Weather images
	images.moon 		= love.graphics.newImage("images/weather/moon.png")				--Moon
	images.sun 			= love.graphics.newImage("images/weather/sun.png")				--Sun

	--↓ Particle images
	images.smoke		= love.graphics.newImage("images/particles/smoke.png") 			--Smoke
	images.fire			= love.graphics.newImage("images/particles/fire.png") 				--Fire

end

function images.update()

	--TODO LOGIC CODE

end

function UPDATE_IMAGES(dt)

	images.update()

end