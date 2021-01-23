extends Control

func _on_credits_pressed() -> void:
	get_tree().change_scene("res://menus/credits/credits.tscn")

func _on_main_menu_pressed() -> void:
	get_tree().change_scene("res://menus/main_menu/main_menu.tscn")
