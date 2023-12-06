-- components/rectangle.lua
local Rectangle = {}

function Rectangle.new(x, y, width, height, color, zIndex)
    local self = {
        x = x,
        y = y,
        width = width,
        height = height,
        color = color or colors.white,
        zIndex = zIndex or 0 -- Default to layer 0
    }

    function self:setColor(newColor)
        self.color = newColor
    end

    function self:render()
        local currentBackgroundColor = term.getBackgroundColour()

        term.setBackgroundColour(self.color)
        term.setTextColor(self.color)

        for i = 1, self.height do
            term.setCursorPos(self.x, self.y + i - 1)
            for j = 1, self.width do
                term.write(" ") -- Fill the rectangle area with spaces
            end
        end

        term.setBackgroundColour(currentBackgroundColor) -- Revert to the original background color
    end

    return self
end

return Rectangle
