#  "Get the Balls"

### Video Demo
https://youtu.be/vAIcTFgK7co

### Description
Get the Balls" is a Lua script that brings to life a simple game concept. Players control a paddle to catch falling balls, testing their agility and timing. The game is developed using the LÖVE framework, known for its graphics capabilities and user input handling.

### Overview of Code Structure
####Initialization
The script begins by importing the LÖVE module, a necessary step in setting up the game environment. It also initializes the random seed for dynamic gameplay experiences. Window dimensions are retrieved using LÖVE's graphics module, preparing for responsive gameplay.

#### Button Creation
Interactivity in "Get the Balls" is managed by the Button function. This function allows the creation of functional buttons for the game menu. Each button is defined by its text, associated function, and dimensions, ensuring clear navigation for players. Methods for checking button presses (checkPressed) and rendering (draw) improve user interaction.

#### Ball Creation
The falling balls are key game elements, adding challenge to the gameplay. The Ball function handles their creation, assigning random colors and positions for variety. Each ball has properties such as level, position, and color, along with methods for movement and drawing, contributing to the gameplay experience.

#### Game State and Variables
Game management revolves around the game table and its associated variables. This table stores game state information, including menu, running, and ended states, as well as player statistics such as points and misses. Additional tables for player, buttons, and balls are essential for gameplay mechanics and user interactions.
#### Game Logic
The game's logic is designed to deliver smooth and engaging gameplay. Key functions such as StartGame, EndGame, and ShowMenu handle state transitions. Core LÖVE functions like love.load(), love.update(dt), and love.draw() manage game initialization, logic updates, and rendering. Mouse input is integrated into the gameplay loop via the love.mousepressed() function, allowing intuitive controls.

### Usage
To start playing "Get the Balls," ensure the LÖVE framework is installed on your system. Save the Lua script as main.lua in a LÖVE project directory. Run the project folder using the LÖVE executable to launch the game.

### Credits
This game script was created by Gesine Fengler as part of CS50X. It demonstrates the use of Lua programming in game development.
