class_name LobbyScene extends Node2D

@onready var avatar = preload("res://src/common/avatar_common/avatar_common.tscn");

func _ready():
	self._addUserName("Craux");
	await self._loadFiles();
	
func _loadFiles():
	self._drawAvatar(load("res://assets/img/borders/bdr_double_ring.png"), null);

func _addUserName(username):
	self.get_node("lobby_header/container_left/name_frame/username").set_text(username);
	
func _drawAvatar(border, _image) -> void:
	var drawing:AvatarCommon = avatar.instantiate();
	drawing.INIT_BORDER = border
	self.add_child(drawing);
	drawing.set_position(Vector2(47,10));
	
	
	
	
	

