# Game "Get the Balls"

### Video Demo
https://youtu.be/vAIcTFgK7co

### Description
"Get the Balls" is an entertaining Lua script that brings to life a simple yet addictive game concept. Players assume control of a paddle to catch falling balls, challenging their agility and timing. The game is built upon the LÖVE framework, leveraging its robust graphics capabilities and intuitive user input handling.

#### Overview of Code Structure
Initialization
The script commences by importing the LÖVE module, a crucial step in setting up the game environment. Additionally, it initializes the random seed to ensure dynamic gameplay experiences with each session. Window dimensions are retrieved using LÖVE's graphics module, laying the groundwork for responsive and immersive gameplay.

#### Button Creation
Interactivity lies at the heart of "Get the Balls," facilitated by the Button function. This function empowers developers to create visually appealing and functional buttons for the game menu. Each button is meticulously defined by its text, associated function, and dimensions, ensuring seamless navigation for players. Methods for checking button presses (checkPressed) and rendering (draw) enhance user engagement and satisfaction.

#### Ball Creation
The falling balls serve as the primary game elements, injecting excitement and challenge into the gameplay. The Ball function orchestrates their creation, imbuing them with random colors and positions for a visually stimulating experience. Each ball boasts distinct properties such as level, position, and color, coupled with specialized methods for movement and drawing. This meticulous attention to detail ensures a dynamic and captivating gaming experience.

#### Game State and Variables
Central to game management are the game table and associated variables. This table serves as the repository for crucial game state information, including menu, running, and ended states, alongside player statistics such as points and misses. Additional tables, including player, buttons, and balls, play pivotal roles in orchestrating gameplay mechanics and user interactions.

#### Game Logic
The backbone of "Get the Balls" lies in its robust game logic, meticulously crafted to deliver seamless and engaging gameplay experiences. Essential functions such as StartGame, EndGame, and ShowMenu orchestrate state transitions, ensuring fluid navigation between game phases. Core LÖVE functions like love.load(), love.update(dt), and love.draw() manage critical aspects of game initialization, logic updates, and rendering, respectively. Mouse input is seamlessly integrated into the gameplay loop via the love.mousepressed() function, enabling intuitive and responsive controls.

#### Usage
To embark on your "Get the Balls" adventure, ensure you have the LÖVE framework installed on your system. Save the provided Lua script as main.lua within a designated LÖVE project directory. Execute the project folder using the LÖVE executable to launch the game and immerse yourself in the thrilling world of falling balls and paddle mastery.

### Dependencies
The seamless operation of "Get the Balls" hinges on the LÖVE framework, a versatile toolset renowned for its prowess in game development. Prior to launching the game, ensure that the LÖVE framework is installed on your system to unlock its full potential.

### Credits
This captivating game script is the brainchild of Gesine Fengler, crafted with passion and precision as part of CS50X. It stands as a testament to the creativity and ingenuity of Lua programming within the realm of game development.
