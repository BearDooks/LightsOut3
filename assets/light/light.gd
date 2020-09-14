extends TextureButton

# Connections
var level_controller
onready var light_glow = get_node("light_glow")

# Variables
var light_state = 'off'
var light_on_sprite = load('res://images/light_on.png')
var light_off_sprite = load('res://images/light_off.png')
var x_cord = 0
var y_cord = 0

func _ready():
	set_process_input(true)
	level_controller = get_node("/root/level")

func toggle_light():
	if light_state == 'off':
		light_state = 'on'
		self.texture_normal = light_on_sprite
		light_glow.visible = true
		
	else:
		light_state = 'off'
		self.texture_normal = light_off_sprite
		light_glow.visible = false


func _on_light_pressed():
	toggle_light()
