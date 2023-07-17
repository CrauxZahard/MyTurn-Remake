class_name MatchScene extends Node2D

func _ready():
	self._loadFiles();
	
func _loadFiles() -> void:
	# Load assets
	self.get_node("bg_match").set_texture(load("res://assets/img/backgrounds/bg_battle_scene.jpg"));
	self.get_node("header_blue").set_texture(load("res://assets/img/huds/battle_scene/header_own.png"));
	self.get_node("header_red").set_texture(load("res://assets/img/huds/battle_scene/header_enemy.png"));
	self.get_node("header_red/enemy_user_container").set_texture(load("res://assets/img/huds/battle_scene/match_name_frame.png"));
	self.get_node("header_blue/own_user_container").set_texture(load("res://assets/img/huds/battle_scene/match_name_frame.png"));
	# Load users information
	var avatarSelf = self._loadAvatar("res://assets/img/borders/bdr_double_ring.png", "res://icon.svg");
	avatarSelf.set_position(Vector2(20,693));
	var avatarOpponent = self._loadAvatar("res://assets/img/borders/bdr_main.png", "res://icon.svg");
	avatarOpponent.set_position(Vector2(1273,5));
	self._addUserName("Tezada", Vector2(1200,7));
	self._addUserName("Craux", Vector2(110,695));
	# Load btn normal state
	self.get_node("header_red/btn_settings").set_texture_normal(load("res://assets/img/buttons/icon_button/btn_settings.png"));
	self.get_node("header_red/btn_played_cards").set_texture_normal(load("res://assets/img/buttons/icon_button/btn_played_cards.png"));
	self.get_node("header_red/btn_chat").set_texture_normal(load("res://assets/img/buttons/icon_button/btn_chat.png"));
	# Load btn pressed state
	self.get_node("header_red/btn_settings").set_texture_pressed(load("res://assets/img/buttons/icon_button/btn_settings_pressed.png"));
	self.get_node("header_red/btn_played_cards").set_texture_pressed(load("res://assets/img/buttons/icon_button/btn_played_cards_pressed.png"));
	self.get_node("header_red/btn_chat").set_texture_pressed(load("res://assets/img/buttons/icon_button/btn_chat_pressed.png"));
	
func _loadAvatar(pborder:String, pimage:String) -> TextureRect:
	var avatarCommon:DrawAvatarCommon = DrawAvatarCommon.new();
	var border:ImageTexture = avatarCommon.drawImage(pborder);
	border.set_size_override(Vector2(70, 70));
	var image:ImageTexture = avatarCommon.drawImage(pimage);
	image.set_size_override(Vector2(60, 60));
	var avatar:TextureRect = avatarCommon.drawAvatar(border, image);
	self.add_child(avatar);
	return avatar;

func _addUserName(uname:String, uposition:Vector2) -> void:
	var username:Label = Label.new();
	username.set_text(uname);
	username.set_position(uposition);
	self.add_child(username);
