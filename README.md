# ezUI - Simple UI Framework for ComputerCraft

**ezUI** is a simple and easy-to-use UI framework for ComputerCraft.

## Getting Started

1. **Installation:**
   - It's as simple as it gets. Just download it, and then put it wherever your program folder is. 

2. **Usage:**
   - In your program, use `require("ezUI.main")` to load the components. Note: change the ezUI `ezUI` to the name of the folder in which main.lua is located.

3. **Create Components:**
   - Use `ezUI.create()` to create components.
   - Customize appearance and behavior as needed.

4. **Render UI:**
   - Display the UI on the screen with `ezUI.render()`.

## Example

```lua
local ezUI = require("ezUI.main")

local text = ezUI.Text.new(5, 10, "Hello, ComputerCraft!", colors.red)
ezUI.create("Text", text)

local button = ezUI.Button.new(5, 5, 15, 3, "Click me", colors.white, colors.blue, colors.lightBlue, onClickHandler)
ezUI.create("Button", button)

ezUI.render()
```
