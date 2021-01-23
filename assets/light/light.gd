extends TextureButton

# Connections
var level_controller : Node
onready var light_glow : Node = get_node("light_glow")

# Variables
var light_on : bool = false
var light_on_sprite : Texture = load('res://images/light_on.png')
var light_off_sprite : Texture = load('res://images/light_off.png')
var x_cord : int = 0
var y_cord : int = 0

func _ready() -> void:
	set_process_input(true)
	level_controller = get_node("/root/level")

func toggle_light() -> void:
	if light_on == false:
		light_on = true
		self.texture_normal = light_on_sprite
		light_glow.visible = true
		
	else:
		light_on = false
		self.texture_normal = light_off_sprite
		light_glow.visible = false


func _on_light_pressed() -> void:
	toggle_light()
