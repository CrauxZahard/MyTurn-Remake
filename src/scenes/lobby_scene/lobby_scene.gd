class_name LobbyScene extends Node2D


func _ready():
	self._addUserName("Craux");
	await self._loadFiles();
	
	
	
func _loadFiles():
	
	#Load assets
	self.get_node("background").set_texture(load("res://assets/img/backgrounds/bg_lobby_scene.jpg"));
	self.get_node("lobby_header").set_texture(load("res://assets/img/huds/lobby_scene/header_lobby.png"));
	self.get_node("lobby_header/container_left").set_texture(load("res://assets/img/huds/lobby_scene/container.png"));
	self.get_node("lobby_header/container_right").set_texture(load("res://assets/img/huds/lobby_scene/container.png"));
	self.get_node("lobby_header/my_turn_logo").set_texture(load("res://assets/img/myturn_logo.png"));
	self.get_node("lobby_header/container_left/name_frame").set_texture(load("res://assets/img/huds/lobby_scene/frame_name.png"));
	# Load Normal state button assets
	self.get_node("btn_battle_start").set_texture_normal(load("res://assets/img/buttons/match_buttons/btn_battle_start.png"));
	self.get_node("btn_match_mode").set_texture_normal(load("res://assets/img/buttons/match_buttons/btn_match_mode.png"));
	self.get_node("lobby_header/container_right/btn_menu").set_texture_normal(load("res://assets/img/buttons/icon_button/btn_menu.png"));
	self.get_node("lobby_header/container_right/btn_friend").set_texture_normal(load("res://assets/img/buttons/icon_button/btn_friend.png"));
	self.get_node("lobby_header/container_right/btn_donut").set_texture_normal(load("res://assets/img/buttons/icon_button/btn_donut.png"));
	# Load Pressed state button assets
	self.get_node("lobby_header/container_right/btn_menu").set_texture_pressed(load("res://assets/img/buttons/icon_button/btn_menu_pressed.png"));
	self.get_node("lobby_header/container_right/btn_friend").set_texture_pressed(load("res://assets/img/buttons/icon_button/btn_friend_pressed.png"));
	self.get_node("lobby_header/container_right/btn_donut").set_texture_pressed(load("res://assets/img/buttons/icon_button/btn_donut_pressed.png"));
	self.get_node("btn_battle_start").set_texture_pressed(load("res://assets/img/buttons/match_buttons/btn_battle_start_pressed.png"));
	self.get_node("btn_match_mode").set_texture_pressed(load("res://assets/img/buttons/match_buttons/btn_match_mode_pressed.png"));
	self._loadAvatar();
	
func _unloadFiles():
	pass
	
func _addUserName(username):
	self.get_node("lobby_header/container_left/name_frame/username").set_text(username);
	
func _loadAvatar():
	var avatarCommon:DrawAvatarCommon = DrawAvatarCommon.new();
	var border:ImageTexture = avatarCommon.drawImage("res://assets/img/borders/bdr_double_ring.png");
	border.set_size_override(Vector2(70, 70));
	var image:ImageTexture = avatarCommon.drawImage("res://icon.svg");
	image.set_size_override(Vector2(60, 60))
	var avatar:TextureRect = avatarCommon.drawAvatar(border, image);
	avatar.set_position(Vector2(47,10));
	self.add_child(avatar)
	
	
	

