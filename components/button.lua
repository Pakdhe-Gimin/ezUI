-- components/button.lua
local Button = {}

function Button.new(x, y, width, height, label, labelColor, buttonColor, clickedColor, onClick, zIndex)
    local self = {
        x = x,
        y = y,
        width = width,
        height = height,
        label = label,
        labelColor = labelColor or colors.white,
        buttonColor = buttonColor or colors.blue,
        clickedColor = clickedColor or colors.lightBlue,
        onClick = onClick,
        isClicked = false,
        zIndex = zIndex or 0 -- Default to layer 0
    }

    function self:render()
        local currentColor = self.isClicked and self.clickedColor or self.buttonColor

        term.setBackgroundColor(currentColor)
        term.setTextColor(self.labelColor)

        for i = 1, self.height do
            term.setCursorPos(self.x, self.y + i - 1)
            term.write(string.rep(" ", self.width))
        end

        local labelX = math.floor((self.width - #self.label) / 2) + self.x
        local labelY = math.floor(self.height / 2) + self.y
        term.setCursorPos(labelX, labelY)
        term.write(self.label)
    end

    function self:handleClick(x, y)
        if x >= self.x and x <= self.x + self.width - 1 and y >= self.y and y <= self.y + self.height - 1 then
            self.isClicked = true

            if self.onClick and type(self.onClick) == "function" then
                self.onClick()
            end

            self:render()
            sleep(0.2)
            self.isClicked = false
            self:render()
        end
    end

    return self
end

return Button
