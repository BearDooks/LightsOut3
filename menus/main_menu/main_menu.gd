extends Control

# Connections


func _ready() -> void:
	audio.play_main_menu_theme()

func _on_new_game_pressed() -> void:
	global.set_game_type('easy')
	get_tree().change_scene("res://assets/level/level.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene("res://menus/options_menu/options_menu.tscn")
