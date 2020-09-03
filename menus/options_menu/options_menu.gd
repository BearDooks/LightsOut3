extends Control

func _on_back_button_pressed():
	get_tree().change_scene("res://menus/main_menu/main_menu.tscn")


func _on_credits_pressed():
	get_tree().change_scene("res://menus/credits/credits.tscn")
