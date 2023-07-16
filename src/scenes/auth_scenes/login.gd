extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_gui_input(event):
	if event.is_pressed() == true:
		get_tree().change_scene_to_file("res://Scene/lobby-scene/lobby.tscn")
	
