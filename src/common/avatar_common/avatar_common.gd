class_name AvatarCommon extends TextureRect

@export var INIT_BORDER = load("res://assets/img/borders/bdr_main.png")
@export var INIT_USER_IMG = load("res://icon.svg")

func _ready():
	self.set_texture(INIT_BORDER);
	self.get_node("image").set_texture(INIT_USER_IMG);


