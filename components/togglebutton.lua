-- components/togglebutton.lua
local ToggleButton = {}

function ToggleButton.new(x, y, width, height, labelOn, labelOff, colorOn, colorOff, labelColor, onToggleOn, onToggleOff, initialState, zIndex)
    local self = {
        x = x,
        y = y,
        width = width,
        height = height,
        labelOn = labelOn or "ON",
        labelOff = labelOff or "OFF",
        colorOn = colorOn or colors.green,
        colorOff = colorOff or colors.red,
        labelColor = labelColor or colors.white,
        onToggleOn = onToggleOn,
        onToggleOff = onToggleOff, -- Default to an empty function
        state = initialState or false, -- Default to the initial state as false (OFF)
        zIndex = zIndex or 0 -- Default to layer 0
    }

    function self:toggleState()
        self.state = not self.state
    end

    function self:getState()
        return self.state
    end

    function self:render()
        local currentColor = self.state and self.colorOn or self.colorOff

        term.setBackgroundColor(currentColor)
        term.setTextColor(self.labelColor)

        for i = 1, self.height do
            term.setCursorPos(self.x, self.y + i - 1)
            term.write(string.rep(" ", self.width))
        end

        local label = self.state and self.labelOn or self.labelOff
        local labelX = math.floor((self.width - #label) / 2) + self.x
        local labelY = math.floor(self.height / 2) + self.y
        term.setCursorPos(labelX, labelY)
        term.write(label)
    end

    function self:handleClick(mouseX, mouseY)
        if mouseX >= self.x and mouseX <= self.x + self.width - 1 and mouseY >= self.y and mouseY <= self.y + self.height - 1 then
            self:toggleState()

            if self:getState() then
                if self.onToggleOn and type(self.onToggleOn) == "function" then
                    self.onToggleOn()
                end

            elseif not self:getState() then
                if self.onToggleOff and type(self.onToggleOff) == "function" then
                    self.onToggleOff()
                end
            end

        end
    end

    return self
end

return ToggleButton
