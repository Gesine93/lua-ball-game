local love = require 'love'

math.randomseed(os.time())
local windowHeight = love.graphics.getHeight()
local windowWidth = love.graphics.getWidth()


-- Creating menu buttons

function Button(text, func, func_param, width, height)
    return {
        width = width or 100,
        height = height or 100,
        func = func or function() print('No function attached') end,
        func_param = func_param,
        text = text or 'No text',
        button_x = 0,
        button_y = 0,
        text_x = 0,
        text_y = 0,
        font = love.graphics.newFont(30),

        checkPressed = function(self, mouse_x, mouse_y)
            if (mouse_x >= self.button_x) and (mouse_y >= self.button_y) and (mouse_x <= self.button_x + self.width) and (mouse_y <= self.button_y + self.height) then
                if self.func_param then
                    self.func(self.func_param)
                else
                    self.func()
                end
            end 
        end,
        
        draw = function(self, button_x, button_y, text_x, text_y, font)
            self.button_x = button_x or self.button_x
            self.button_y = button_y or self.button_y
            self.font = font or self.font

            if text_x then
                self.text_x = text_x + self.button_x
            else
                self.text_x = self.button_x
            end

            if text_y then
                self.text_y = text_y + self.button_y
            else
                self.text_y = self.button_y
            end

            love.graphics.setColor(0.6, 0.6, 0.6)
            love.graphics.rectangle('fill', self.button_x, self.button_y, self.width, self.height)
            love.graphics.setColor(0,0,0)
            love.graphics.print(self.text, self.font, self.text_x, self.text_y)
            love.graphics.setColor(1,1,1)
        end
    }
end


-- Creating the balls

function Ball(level)
    local ball_x = math.random(5, windowWidth-5)
    local ball_y = math.random(-5, -105)
    local radius = 5
    local red = math.random(0.4, 1)
    local green = math.random(0.4, 1)
    local blue = math.random(0.4, 1)
    return {
        level = level or 1,
        radius = radius,
        x = ball_x,
        y = ball_y,
        red = red,
        green = green,
        blue = blue,

        move = function(self)
            self.y = self.y + self.level * 2
        end,

        draw = function(self)
            love.graphics.setColor(self.red, self.green, self.blue)
            love.graphics.circle('fill', self.x, self.y, self.radius)
            love.graphics.setColor(1,1,1)
        end
    }
end


-- Variables

local game = {
    state = {
        menu = true,
        running = false,
        ended = false
    },
    points = 0,
    missed = 0
}


local player = {
    height = 10,
    width = 100,
    x = windowWidth/2 - 50,
    y = windowHeight-10
}

local buttons = {
    menu_state = {},
    ended_state = {}
}

local balls = {}


-- Function to start a game

function StartGame()
    game.state.menu = false
    game.state.running = true
    game.state.ended = false
    game.points = 0
    game.missed = 0
    balls = {Ball(1)}
end


-- Function to end the game

function EndGame()
    game.state.menu = false
    game.state.running = false
    game.state.ended = true
end


-- Function to open Menu

function ShowMenu()
    game.state.menu = true
    game.state.running = false
    game.state.ended = false
end

-- Buttons 

local play_button = Button('Play', StartGame, nil, 100, 60)
local exit_button = Button('Exit', love.event.quit, nil, 100, 60)
local menu_button = Button('Menu', ShowMenu, nil, 100, 60)



-- Load function

function love.load()
    love.window.setTitle('Get the balls')
    buttons.menu_state.play_game = play_button
    buttons.menu_state.exit_game = exit_button
    buttons.ended_state.menu_button = menu_button
end


-- Update function
local timer = 0
local interval = 5

function RandomWithStep(min, max, step)
    local range = (max - min) / step
    local randomIndex = math.random(0, range)
    return min + randomIndex * step
end

function love.update(dt)
    if game.state['running'] then
        timer = timer + dt
        if timer >= interval then
            table.insert(balls, 1, Ball(math.random(1,math.ceil(game.points/10))))
            interval = RandomWithStep(0.5, 3, 0.25)
            timer = timer - interval -- Reset the timer
        end
        if game.missed == 10 then
            EndGame()
        end
        -- Player movement logic
        local x, y = love.mouse.getPosition()
        -- Restricting player movement to the right window boundary
        player.x = math.min(x, windowWidth - player.width)
        
        -- Update ball positions and check for collisions
        for i = #balls, 1, -1 do
            balls[i]:move()
            -- Check if ball is off the screen
            if balls[i].y > windowHeight then
                game.missed = game.missed + 1
                table.remove(balls, i)
            else
                -- Check for collision with player's bar
                if balls[i].y + balls[i].radius >= player.y then
                    if balls[i].x >= player.x and balls[i].x <= player.x + player.width then
                        game.points = game.points + 1
                        table.remove(balls, i)
                    end
                end
            end
        end
    end
end




-- Draw function

function love.draw()
    if game.state['running'] then
        love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)
        love.graphics.printf('Points: ' .. game.points, love.graphics.newFont(16), 0, 10, love.graphics.getWidth(), 'center')
        love.graphics.printf('Missed: ' .. game.missed, love.graphics.newFont(16), 0, 30, love.graphics.getWidth(), 'center')
        for i = 1, #balls do
            balls[i]:draw()
        end
    elseif game.state['menu'] then
        play_button:draw(350,180,15,15,love.graphics.newFont(30))
        exit_button:draw(350,250,15,15,love.graphics.newFont(30))
    elseif game.state['ended'] then
        love.graphics.printf('Points: ' .. game.points, love.graphics.newFont(30), 0, 180, love.graphics.getWidth(), 'center')
        menu_button:draw(350,250,10,15,love.graphics.newFont(30))
    end
end


-- Check if mouse was pressed on button

function love.mousepressed(x,y,button,istouch,presses)
    if game.state['menu'] then
        for index in pairs (buttons.menu_state) do
            buttons.menu_state[index]:checkPressed(x,y)
        end
    elseif game.state['ended'] then
        for index in pairs (buttons.ended_state) do
            buttons.ended_state[index]:checkPressed(x,y)
        end
    end
end


