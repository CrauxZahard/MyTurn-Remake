# UTILIZING SHADERS

Shader is use for advance styling of Textures in the game, it can add animation or effects.

- To make a new shader we need to go to the nodes inspector and under CanvasItem section, select Material.
- The file extension of shader is `.gdshader`.
- We can find other shaders made by others devs in [godot shaders](https://godotshaders.com).
- We can import shaders in Material property.

## Flash Example

- Created a scene named utlizing-shaders.
- Set the scene named utlizing-shaders as main scence
- Under the utlizing-shaders there are two nodes flash-button and warrior-stomp.
- Created a new shader file called utilizing-shader.gdshader.
- In warrior-stomp, the new created shader was imported.
- In the flash-button we access the warriors material properties and modify it when the button is pressed.

## Note

- The files has comments for you to understand
