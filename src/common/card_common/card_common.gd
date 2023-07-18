class_name CardCommon extends Sprite2D

var selected:bool = false;
@export var INITPOS:Vector2 = Vector2(700,700);
@export var INITSKIN = EnumContainerHelper.CardColorsEnum.RED;
@export var INITNAME:String = "Attack";
@export var INITMANA:String = "0";
@export var INITDESC:String = "Deals attack damage\n to target enemy";

func _ready():
	
	self.get_node("card_skin/card_desc").set_text(INITDESC);
	self._findCardColor(INITSKIN);
	self.set_position(INITPOS);
	self.get_node("area").input_event.connect(self._onPressedLeftClickMouse);
	
	

func _process(delta):
	self._onMouseDrag(get_global_mouse_position(), delta);

func _onPressedLeftClickMouse(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected = true;
			
		else:
			selected = false;

func _onMouseDrag(mousePos:Vector2, delta):
	if(selected == true):
		self._isDragged(mousePos);
	if(selected == false):
		self._isNoCollision(delta)
	
func _isNoCollision(delta) -> void:
	self.set_position(INITPOS);
	self.set_scale(Vector2(1,1));
	
func _isDragged(mousePos):
	self.set_position(mousePos);
	self.set_scale(Vector2(1.2,1.2));
	
func _findCardColor(color) -> void:
	var colorEnum = EnumContainerHelper.CardColorsEnum
	if(color == colorEnum.RED):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_red.png"));
	if(color == colorEnum.GREEN):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_green.png"));
	if(color == colorEnum.BLUE):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_blue.png"));
	if(color == colorEnum.YELLOW):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_yellow.png"));
	if(color == colorEnum.PURPLE):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_purple.png"));
	if(color == colorEnum.GREY):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_grey.png"));

