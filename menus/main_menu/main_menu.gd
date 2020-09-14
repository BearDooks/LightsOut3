extends Control

# Connections


func _ready():
	audio.play_main_menu_theme()

func _on_options_pressed():
	get_tree().change_scene("res://menus/options_menu/options_menu.tscn")

func _on_new_game_pressed():
	global.set_game_type('easy')
	get_tree().change_scene("res://assets/level/level.tscn")
