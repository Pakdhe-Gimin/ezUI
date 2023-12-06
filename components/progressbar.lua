-- components/progressbar.lua
local ProgressBar = {}

function ProgressBar.new(x, y, width, height, startValue, minValue, maxValue, progressColor, bgColor, orientation, zIndex)
    local self = {
        x = x,
        y = y,
        width = width,
        height = height,
        minValue = minValue or 0,
        maxValue = maxValue or 100,
        progressColor = progressColor or colors.green,
        bgColor = bgColor or colors.gray,
        value = startValue or minValue or 0, -- Default to the startValue, then minValue, then 0
        orientation = orientation or "horizontal", -- Default to horizontal
        zIndex = zIndex or 0 -- Default to layer 0
    }

    function self:setValue(newValue)
        -- Ensure the new value is within the specified range
        self.value = math.min(math.max(newValue, self.minValue), self.maxValue)
    end

    function self:getValue()
        return self.value
    end

    function self:render()
        local currentBackgroundColor = term.getBackgroundColour()

        term.setBackgroundColour(self.bgColor)
        term.setTextColor(self.progressColor)

        if self.orientation == "horizontal" then
            self:renderHorizontal()
        elseif self.orientation == "vertical" then
            self:renderVertical()
        else
            error("Invalid orientation. Supported values are 'horizontal' or 'vertical'.")
        end

        term.setBackgroundColour(currentBackgroundColor) -- Revert to the original background color
    end

    function self:renderHorizontal()
        local progressWidth = math.ceil((self.value - self.minValue) / (self.maxValue - self.minValue) * self.width)

        for i = 1, self.height do
            term.setCursorPos(self.x, self.y + i - 1)
            for j = 1, self.width do
                if j <= progressWidth then
                    term.setBackgroundColour(self.progressColor) -- Set the background color to progress color
                    term.write(" ") -- Filled portion
                else
                    term.setBackgroundColour(self.bgColor) -- Set the background color to bg color
                    term.write(" ") -- Empty portion
                end
            end
        end
    end

    function self:renderVertical()
        local progressHeight = math.ceil((self.value - self.minValue) / (self.maxValue - self.minValue) * self.height)

        for i = self.height, 1, -1 do -- Start from the bottom and go up
            term.setCursorPos(self.x, self.y + i - 1)
            for _ = 1, self.width do
                if self.height - i < progressHeight then
                    term.setBackgroundColour(self.progressColor) -- Set the background color to progress color
                    term.write(" ") -- Filled portion
                else
                    term.setBackgroundColour(self.bgColor) -- Set the background color to bg color
                    term.write(" ") -- Empty portion
                end
            end
        end
    end

    return self
end

return ProgressBar
