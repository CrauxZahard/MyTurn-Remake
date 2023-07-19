class_name DrawAvatarCommon

func drawAvatar(border: ImageTexture, image: ImageTexture) -> TextureRect:
	var borderInit:TextureRect = TextureRect.new();
	borderInit.set_texture(border);
	var img:TextureRect = self._setImage(image);
	var imageVector:Vector2 = self._setCenter(borderInit.get_minimum_size(), img.get_minimum_size());
	img.set_position(imageVector);
	borderInit.add_child(img);
	return borderInit

func _setImage(image: ImageTexture) -> TextureRect:
	var imageInit:TextureRect = TextureRect.new();	
	imageInit.set_texture(image);
	imageInit.material = ShaderMaterial.new();
	imageInit.material.shader = load("res://src/shaders/corner_radius.gdshader");
	imageInit.material.set_shader_parameter("corner_radius", imageInit.get_minimum_size().x);
	return imageInit
	
func _setCenter(border: Vector2, image: Vector2) -> Vector2:
	var getVectorMargin = Vector2(border.x - image.x, border.y - image.y);
	return Vector2(getVectorMargin.x / 2, getVectorMargin.y/ 2);
	
func drawImage(img: String) -> ImageTexture:
	return ImageTexture.create_from_image(Image.load_from_file(ProjectSettings.globalize_path(img)));

