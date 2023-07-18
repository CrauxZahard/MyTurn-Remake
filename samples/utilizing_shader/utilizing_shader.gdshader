// This shader is a flash effect shader
shader_type canvas_item;

// This will be shown as a new parameter in Inspector of the TextureRect under materials
uniform vec4 flash = vec4(1.0);
uniform float flash_modifier = 1;

// Main shader function
void fragment() {
	// First we need the exact color of the image in the textureRect
	vec4 color = texture(TEXTURE, UV);
	// Here we mix another color, this will be the flash effect
	color.rgb = mix(color.rgb, flash.rgb , flash_modifier);
	// Now we indicate the change of color to the color property of the textureRect
	COLOR = color;
}
