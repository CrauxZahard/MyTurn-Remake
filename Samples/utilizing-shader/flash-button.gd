extends Button

var warlord = null;
var timer = 0;
var waitTime = 1;

func _ready():
	# ACCESSING PROPERTIES OF WARLORD STOMP NODE
	warlord = get_parent().get_node("warlord-stomp");
	pass

func _process(delta):
	self._removeMixColor(delta);
	pass

# SETTING THE FLASH_MODIFIER SHADER PARAMETER TO 0.4 TO DISPLAY MIXED COLOR WHEN BUTTON PRESSED
func _on_pressed():
	warlord.material.set_shader_parameter("flash_modifier", .4);
	pass

# RESETTING THE FLASH_MODIFIER SHADER PARAMETER TO ZERO, WHEN SPECIFIC TIME REACHED
func _removeMixColor(delta):
	timer += delta;
	if timer > waitTime:
		warlord.material.set_shader_parameter("flash_modifier", 0);
		timer = 0
	


