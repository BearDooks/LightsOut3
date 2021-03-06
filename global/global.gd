extends Node

### Constants ###
const game_version : float = 1.3

### Variables ###
var game_type

# Dictionary used to keep track of game stats
var stats : Dictionary = {

}

### Functions ###

# Ready function called when the game is loaded
func _ready() -> void:
	load_game()
	print(stats)

func set_game_type(type) -> void:
	game_type = type

# Function to save the game to the local storage
#TODO: Fix it so there is a tag if this is the web export if we go down that path
func save_game() -> void:
	pass
	# Check for issues opening the file
	# If there is an issue break from the function
	var game_file = File.new()
	if game_file.open_encrypted_with_pass("user://LightsOutData.sav", File.WRITE, OS.get_unique_id()) != 0:
		print("There was an error opening the save game file")
		return
	
	# Convert file to JSON, and write it to the oepn file
	# After writing it, close the file
	game_file.store_line(to_json(stats))
	game_file.close()
	print("The game has been saved successfully")

# Function to load the game back into memory for the user
func load_game() -> void:
	# Check if the game file exists
	# If not break from the function
	var game_file = File.new()
	if not game_file.file_exists("user://LightsOutData.sav"):
		print("No save file exists currently")
		return
	
	# Check for issues opening the file
	if game_file.open_encrypted_with_pass("user://LightsOutData.sav", File.READ, OS.get_unique_id()) != 0:
		print("There was an error opening the save game file")
		return
	
	# Load the JSON into a dictionry
	stats = parse_json(game_file.get_line())
	game_file.close()
	print("The game has been loaded successfully")
