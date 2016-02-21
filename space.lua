space = {}
local stars = nil

function space.load()

    space.starNum = love.math.random(60, 200) 
    space.starSize = 10
    space.starXPosition = 100
    space.starYPosition = 100

end

function space.draw()

    love.graphics.setBackgroundColor(0, 0, 0)

end

local function createStars()
    if stars==nil then
        stars={}
        for i = 1, space.starNum do
            stars[i] = {
                Size = love.math.random(1, 10),
                XPosition = love.math.random(1, 1200),
                YPosition = love.math.random(1, 750),
            }
        end
    end
end

function space.drawStars()
    createStars()
    for i, star in ipairs(stars) do
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", star.XPosition, star.YPosition, star.Size, star.Size)
    end
end

function UPDATE_SPACE(dt)

end

function DRAW_SPACE()

    space.draw()
    space.drawStars()

end