A 2D precision platformer built with **Godot 3** and **GDScript**. You play as a shape-shifting character that can switch between a **square** and a **triangle**, each with its own speed and jump height, to get through a series of increasingly tricky levels against the clock.

Created as a creative project (*loovtöö*).


## Features

- **Two playable forms**: switch on the fly between square and triangle
  - **Square**: faster, lower jump, can wall-jump
  - **Triangle**: slower, higher jump
- **Wall-jump and slow wall-slide** mechanics for the square form
- **Sprint** for faster ground movement
- **Multiple levels** with a flag/goal at the end of each, plus fall zones that trigger game over
- **Global timer** that runs across the game (implemented as an autoload singleton)
- **Full game flow**: title screen, main menu, game over, "try again", and win screens
- **Sandbox scene** for testing mechanics

## Controls

| Action | Keys |
|---|---|
| Move left | `A` / `←` |
| Move right | `D` / `→` |
| Jump | `Space` |
| Sprint | `Ctrl` |
| Switch shape | `Z` |
| Wall-jump | Hold `Space` while pressing away from the wall |

## Project structure
Shapes/
  Assets/              # Sprites, tiles and other art
  project.godot        # Godot project config (input map, autoloads, main scene)

