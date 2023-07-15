extends Button

var show = {
	"warlord": null,
	"timer" : 0,
	"wait_time": 1
};

func _ready():
	# ACCESSING PROPERTIES OF WARLORD STOMP NODE
	show.warlord = get_parent().get_node("warlord-stomp");
	pass

func _process(delta):
	self._removeMixColor(delta);
	pass

# SETTING THE FLASH_MODIFIER SHADER PARAMETER TO 0.4 TO DISPLAY MIXED COLOR WHEN BUTTON PRESSED
func _on_pressed():
	show.warlord.material.set_shader_parameter("flash_modifier", .4);
	pass

# RESETTING THE FLASH_MODIFIER SHADER PARAMETER TO ZERO, WHEN SPECIFIC TIME REACHED
func _removeMixColor(delta):
	if _isTimeout(delta):
		show.warlord.material.set_shader_parameter("flash_modifier", 0);
		show.timer = 0
	pass

# A TIMEOUT FUNCTION THAT RETURNS TRUE OR FALSE	
func _isTimeout(delta):
	show.timer += delta;
	return show.timer > show.wait_time;
	


