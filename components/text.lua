-- components/text.lua
local Text = {}

function Text.new(x, y, content, textColor, bgColor, zIndex)
    local self = {
        x = x,
        y = y,
        content = content or "Default Text",
        textColor = textColor or colors.white,
        bgColor = bgColor or term.getBackgroundColour(), -- Default to current background color
        zIndex = zIndex or 0
    }

    function self:setText(newContent)
        self.content = newContent
    end

    function self:getText()
        return self.content
    end

    function self:render()
        local currentBackgroundColor = term.getBackgroundColour()

        term.setBackgroundColour(self.bgColor)
        term.setTextColor(self.textColor)
        term.setCursorPos(self.x, self.y)
        term.write(self.content)

        term.setBackgroundColour(currentBackgroundColor) -- Revert to the original background color
    end

    return self
end

return Text
