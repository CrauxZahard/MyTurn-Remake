extends Control
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
	$VBoxContainer.set_size(Vector2(250, get_viewport().size.y))
	pass 
