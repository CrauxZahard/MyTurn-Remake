extends Control
@export var buttons: ButtonGroup
enum Selected {
	SHOP,
	DECK,
	PLAY,
	FRIENDS,
	SETTINGS
}

var choosed = Selected.SHOP
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
