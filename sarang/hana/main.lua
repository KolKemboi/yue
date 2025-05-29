-- I believe this is the init func,
function love.load()
	x = 200
	y = 300
end

local counter = 0
function love.update(dt)
	counter = counter + dt
	function love.keypressed(key)
		-- exit window
		if key == "escape" then
			love.event.quit()
		end
	end
	-- move down
	if love.keyboard.isDown("s") then
		y = y + 5
	end
	-- move down
	if love.keyboard.isDown("w") then
		y = y - 5
	end
	-- move down
	if love.keyboard.isDown("a") then
		x = x - 5
	end
	-- move left
	if love.keyboard.isDown("d") then
		x = x + 5
	end
end

-- making assest
local tab = {
	{ math.random(40, 400), math.random(40, 400) },
	{ math.random(40, 400), math.random(40, 400) },
	{ math.random(40, 400), math.random(40, 400) },
	{ math.random(40, 400), math.random(40, 400) },
	{ math.random(40, 400), math.random(40, 400) },
	{ math.random(40, 400), math.random(40, 400) },
	{ math.random(40, 400), math.random(40, 400) },
	{ math.random(40, 400), math.random(40, 400) },
	{ math.random(40, 400), math.random(40, 400) },
	{ math.random(40, 400), math.random(40, 400) },
}

-- then this is the render call
function love.draw()
	love.graphics.print("x Val" .. x, 10, 10)
	love.graphics.print("y Val" .. y, 10, 20)
	love.graphics.print("Counter" .. math.floor(counter), 10, 30)

	for k, val in ipairs(tab) do
		love.graphics.rectangle("fill", val[1], val[2], 50, 50)
	end

	-- if math.floor(counter) >= 10 then
	-- 	local remIdx = math.random(#tab)
	-- 	table.remove(tab, remIdx)
	-- end

	-- making bullets
	love.graphics.circle("fill", x, y, 20)

	--
end
