class_name MatchIconCommon extends ColorRect

@export var INIT_ICON:CompressedTexture2D = load("res://assets/img/huds/battle_scene/ico_used_card.png");
@export var INIT_TEXT:String = "10"; 

func _ready():
	self.get_node("icon").set_texture(INIT_ICON);
	self.get_node("text").set_text(INIT_TEXT);



