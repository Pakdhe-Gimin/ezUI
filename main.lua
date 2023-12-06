-- main.lua
local ezUI = {}

-- Load all components
ezUI.Text = require("ezUI.components.text")
ezUI.Button = require("ezUI.components.button")
ezUI.Rectangle = require("ezUI.components.rectangle")
ezUI.ProgressBar = require("ezUI.components.progressbar")
ezUI.ToggleButton = require("ezUI.components.togglebutton")
-- Add other component requires similarly

-- Components table to store created components
ezUI.createdComponents = {}

function ezUI.create(name, component)
    ezUI.createdComponents[name] = component
end

function ezUI.render()
    local components = {}

    for _, component in pairs(ezUI.createdComponents) do
        table.insert(components, component)
    end

    -- Sort components based on z-index
    table.sort(components, function(a, b)
        return a.zIndex < b.zIndex
    end)

    while true do
        for _, component in ipairs(components) do
            component:render()
        end

        local event, button, x, y = os.pullEvent("mouse_click")
        for _, component in ipairs(components) do
            if component.handleClick then
                component:handleClick(x, y)
            end
        end
    end
end

return ezUI
