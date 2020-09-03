extends Node

# Connections
onready var music_player = get_node("music_player")

# Variables
var currently_playing

# Music
var main_menu_theme = "res://audio/A million light years between us.ogg"
var level_theme = "res://audio/enchanted tiki 86.ogg"

var mute_music = false
var mute_sfx = false

# A function to toggle if the music for the game plays or not
func toggle_music():
	if music_player.playing:
		music_player.stop()
	if mute_music == true:
		mute_music = false
	else:
		mute_music = true

func play_main_menu_theme():
	if currently_playing != "main_menu_theme":
		music_player.stop()
		if mute_music != true:
			music_player.stream = load(main_menu_theme)
			currently_playing = "main_menu_theme"
			music_player.play()

func play_level_theme():
	if currently_playing != "level_theme":
		music_player.stop()
		if mute_music != true:
			music_player.stream = load(level_theme)
			currently_playing = "level_theme"
			music_player.play()
