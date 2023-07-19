class_name MatchScene extends Node2D

const CARD_SKIN_ENUM = EnumContainerHelper.CardSkinEnum;

@onready var card = preload("res://src/common/card_common/card_common.tscn");
@onready var avatar = preload("res://src/common/avatar_common/avatar_common.tscn");
@onready var matchIcon = preload("res://src/common/match_icon_common/match_icon_common.tscn");

func _ready():
	self._loadFiles();

	
func _loadFiles() -> void:
	# Initiate Own userinfo
	var ownAvatar:AvatarCommon = self._drawAvatar(load("res://assets/img/borders/bdr_double_ring.png"), null);
	ownAvatar.set_position(Vector2(30, 680));
	var ownIconUse:MatchIconCommon = self._drawMatchIcon(load("res://assets/img/huds/battle_scene/ico_used_card.png"), "22");
	ownIconUse.set_position(Vector2(110, 730));
	var ownIconRemaining:MatchIconCommon = self._drawMatchIcon(load("res://assets/img/huds/battle_scene/ico_remaining_card_ico.png"), "22");
	ownIconRemaining.set_position(Vector2(165, 730));
	var ownMana:MatchIconCommon = self._drawMatchIcon(load("res://assets/img/huds/battle_scene/ico_mana.png"), "10/10");
	ownMana.set_position(Vector2(225, 730));
	
	# Initiate Opponent userInfo
	var oppAvatar:AvatarCommon = self._drawAvatar(load("res://assets/img/borders/bdr_main.png"), null);
	oppAvatar.set_position(Vector2(1270, 15	));
	var oppIconUse:MatchIconCommon = self._drawMatchIcon(load("res://assets/img/huds/battle_scene/ico_used_card.png"), "22");
	oppIconUse.set_position(Vector2(1215, 65));
	var oppIconRemaining:MatchIconCommon = self._drawMatchIcon(load("res://assets/img/huds/battle_scene/ico_remaining_card_ico.png"), "22");
	oppIconRemaining.set_position(Vector2(1155, 65));
	var oppMana:MatchIconCommon = self._drawMatchIcon(load("res://assets/img/huds/battle_scene/ico_mana.png"), "10/10");
	oppMana.set_position(Vector2(1070, 65));
	
	# Initiate Card
	self._drawCard(Vector2(400,700), CARD_SKIN_ENUM.GREEN);
	self._drawCard(Vector2(500,700), CARD_SKIN_ENUM.PURPLE);
	self._drawCard(Vector2(600,700), CARD_SKIN_ENUM.GREEN);
	self._drawCard(Vector2(600,700), CARD_SKIN_ENUM.GREY);
	self._drawCard(Vector2(700,700), CARD_SKIN_ENUM.RED);
	self._drawCard(Vector2(800,700), CARD_SKIN_ENUM.YELLOW);
	self._drawCard(Vector2(900,700), CARD_SKIN_ENUM.BLUE);
	self._drawCard(Vector2(1000,700), CARD_SKIN_ENUM.RED);
	self._drawCard(Vector2(1100,700), CARD_SKIN_ENUM.BLUE);
	self._drawCard(Vector2(1200,700), CARD_SKIN_ENUM.PURPLE);

func _drawAvatar(border, _image) -> AvatarCommon:
	var drawing:AvatarCommon = avatar.instantiate();
	drawing.INIT_BORDER = border
	self.add_child(drawing);
	return drawing

func _drawCard(initPos:Vector2, ccolor) -> void:
	var drawing:CardCommon = card.instantiate();
	drawing.INIT_POSITION = initPos;
	drawing.INIT_SKIN = ccolor;
	self.add_child(drawing);
	
func _drawMatchIcon(icon:CompressedTexture2D, text:String) -> MatchIconCommon:
	var drawing:MatchIconCommon = matchIcon.instantiate();
	drawing.INIT_ICON = icon
	drawing.INIT_TEXT = text
	drawing.set_scale(Vector2(0.6,0.6))
	self.add_child(drawing);
	return drawing

