extends Node

# Preloads
var light_asset : PackedScene = preload("res://assets/light/light.tscn")

# Constants

# Variables
onready var game_type : String = global.game_type
onready var lights_node : Node = get_node("lights")

var x_limit : int
var y_limit : int
var top_limit : int
var grid_length : int
var num_lights : int
var game_state : String = 'paused'
var light_array : Array = []
var moves_made : int = 0

func _ready() -> void:
	_set_number_of_lights()
	x_limit = get_viewport().get_visible_rect().size.x
	y_limit = get_viewport().get_visible_rect().size.y
	top_limit = (y_limit / 10)
	grid_length = sqrt(num_lights)
	_load_lights()

# Sets the number of lights in the gird based on the level of difficulty picked by the user
# Has a failback to 'easy' in case something goes wrong
func _set_number_of_lights() -> void:
	if game_type == 'easy':
		num_lights = 9
	elif game_type == 'medium':
		num_lights = 16
	elif game_type == 'hard':
		num_lights = 25
	else:
		num_lights = 9

# Function to loop through and create each light for the game on the screen
func _load_lights() -> void:
	game_state = 'building'
	var loop_run = 1
	var row_num = 1
	var col_num = 1
	var col_width = (x_limit / grid_length) - 32 # need to remove 32 to fix the placment issue of non center

	while(loop_run <= num_lights):
		var light = light_asset.instance()
		light.name = str("Light",row_num,col_num)
		light.x_cord = row_num
		light.y_cord = col_num
		light.rect_position = Vector2((col_width * col_num)-(col_width/2),(top_limit * row_num) + top_limit)
		lights_node.add_child(light)
		light_array.append(str(row_num,col_num))
		if (col_num < grid_length):
			col_num += 1
		else:
			col_num = 1
			row_num += 1
		loop_run += 1

func change_lights(x_cord, y_cord) -> void:
	if game_state == 'running':
		moves_made += 1
	var changed_light = str('Light',x_cord,y_cord)
	lights_node.get_node(changed_light).toggle_light()
