class_name DrawCardCommon

func drawCardSprite(cname:String, cmana:int, cdesc:String, cimage:String, ccolor) -> Sprite2D:
	# Designing name label
	var nameLabel:Label = Label.new(); 
	nameLabel.set_text(cname);
	nameLabel.set_position(Vector2(-51, -115));
	nameLabel.add_theme_font_size_override("font_size", 20);
	
	# Designing mana label
	var manaLabel:Label = Label.new(); 
	manaLabel.set_text(str(cmana));
	manaLabel.set_position(Vector2(-83, -122));
	manaLabel.add_theme_font_size_override("font_size", 30);

	# Designing desc label
	var descLabel:Label = Label.new(); 
	descLabel.set_text(cdesc);
	descLabel.vertical_alignment = VERTICAL_ALIGNMENT_CENTER;
	descLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER;
	descLabel.add_theme_font_size_override("font_size", 12);
	var getVectors:Vector2 = self._getPositionBaseOnSize(descLabel.get_minimum_size())
	descLabel.set_position(getVectors);
	
	# Designing card image
	var textureDisplay:TextureRect = TextureRect.new();
	var img:ImageTexture = ImageTexture.create_from_image(Image.load_from_file(ProjectSettings.globalize_path(cimage)));
	img.set_size_override(Vector2(194, 106))
	textureDisplay.set_texture(img);
	textureDisplay.set_position(Vector2(-97, -74));
	
	# Adding 2DAreaCollision
	var cardArea:Area2D = Area2D.new();
	var collisioShape:CollisionShape2D = CollisionShape2D.new();
	var shape:RectangleShape2D = RectangleShape2D.new();
	shape.set_size(Vector2(200, 250))
	collisioShape.set_shape(shape);
	cardArea.add_child(collisioShape);
	cardArea.input_event.connect(self._onPressedLeftClickMouse);
	
	# Designing card sprite
	var card:Sprite2D = Sprite2D.new();
	self._findCardColor(ccolor, card)
	card.add_child(manaLabel);
	card.add_child(nameLabel);
	card.add_child(descLabel);
	card.add_child(textureDisplay);
	card.add_child(cardArea);
	cardArea.set_position(card.get_position());
	
	return card;

func _onPressedLeftClickMouse(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("Pressed");
		else:
			print("Released");
			
			
		
func _findCardColor(color, sprite:Sprite2D) -> void:
	var colorEnum = EnumContainerHelper.CardColorsEnum
	if(color == colorEnum.RED):
		sprite.set_texture(load("res://assets/img/card_skins/skin_red.png"));
	if(color == colorEnum.GREEN):
		sprite.set_texture(load("res://assets/img/card_skins/skin_green.png"));
	if(color == colorEnum.BLUE):
		sprite.set_texture(load("res://assets/img/card_skins/skin_blue.png"));
	if(color == colorEnum.YELLOW):
		sprite.set_texture(load("res://assets/img/card_skins/skin_yellow.png"));
	if(color == colorEnum.PURPLE):
		sprite.set_texture(load("res://assets/img/card_skins/skin_purple.png"));

func _getPositionBaseOnSize(size:Vector2):	
	var xAxis:float = size.x/2;
	var yAxis:float = size.y/2;
	if(xAxis > 70):
		return Vector2(-xAxis + 24, yAxis + 32);
	if(xAxis > 100):
		return Vector2(0, 0);
	return Vector2(-xAxis + 19, yAxis + 32);
