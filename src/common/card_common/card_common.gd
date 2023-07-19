class_name CardCommon extends Sprite2D

var selected:bool = false;
@export var INIT_POSITION:Vector2 = Vector2(700,700);
@export var INIT_SKIN = EnumContainerHelper.CardSkinEnum.RED;
@export var INIT_NAME:String = "Attack";
@export var INIT_MANA:String = "0";
@export var INIT_DESC:String = "Deals attack damage\n to target enemy";
@export var IS_CARD_BACK:bool = false;

func _ready():
	self.get_node("card_skin/card_desc").set_text(INIT_DESC);
	self._findCardSkin(INIT_SKIN);
	self.set_position(INIT_POSITION);
	self.get_node("area").input_event.connect(self._onPressedLeftClickMouse);

func _process(delta):
	self._onMouseDrag(get_global_mouse_position());

func _onPressedLeftClickMouse(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected = true;
		else:
			selected = false;

func _onMouseDrag(mousePos:Vector2) -> void:
	if(selected == true):
		self._isDragged(mousePos);
	if(selected == false):
		self._isNoCollision();

func _isNoCollision() -> void:
	self.set_position(INIT_POSITION);
	self.set_scale(Vector2(1,1));

func _isDragged(mousePos) -> void:
	self.set_position(mousePos);
	self.set_scale(Vector2(1.2,1.2));

func _findCardSkin(skin) -> void:
	var skinEnum = EnumContainerHelper.CardSkinEnum
	if(skin == skinEnum.RED):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_red.png"));
	if(skin == skinEnum.GREEN):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_green.png"));
	if(skin == skinEnum.BLUE):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_blue.png"));
	if(skin == skinEnum.YELLOW):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_yellow.png"));
	if(skin == skinEnum.PURPLE):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_purple.png"));
	if(skin == skinEnum.GREY):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_grey.png"));
	if(skin == skinEnum.OTHERS):
		self.get_node("card_skin").set_texture(load("res://assets/img/card_skins/skin_back.png"));
