extends Node2D
var cardColorEnum = EnumContainerHelper.CardColorsEnum;

var CARDS = [
	{
		"cname": "Attack",
		"cmana": 0,
		"cdesc": "Deals damage to\ntarget enemy.",
		"cimage": "res://icon.svg",
		"ccolor": cardColorEnum.RED,
		"cposition": Vector2(200, 300)
	},
	{
		"cname": "Cold bolt",
		"cmana": 1,
		"cdesc": "Deals ice damage and\nfreeze target enemy.",
		"cimage": "res://icon.svg",
		"ccolor": cardColorEnum.GREEN,
		"cposition": Vector2(500, 300)
	},
	{
		"cname": "Fire bolt",
		"cmana": 1,
		"cdesc": "Deals fire damage and\nburn target enemy.",
		"cimage": "res://icon.svg",
		"ccolor": cardColorEnum.BLUE,
		"cposition": Vector2(800, 300)
	}
];

func _ready():
	var cardinal = DrawCardCommon.new();
	for card in CARDS:
		add_child(cardinal.drawCardSprite(card.cname, card.cmana, card.cdesc, card.cimage, card.ccolor, card.cposition));
	
