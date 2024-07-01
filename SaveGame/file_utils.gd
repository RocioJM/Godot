extends Node

var ruta_archivo : String = "res://save_game.dat"

func save_game(level : Label, coins : Label, player : CharacterBody2D) :
	var data : Dictionary = {
		level = level.get_text(),
		coins = coins.get_text(),
		positionX = player.position.x,
		positionY = player.position.y
	}

	var file = FileAccess.open(ruta_archivo,FileAccess.WRITE)
	var data_json = JSON.stringify(data)
	
	file.store_line(data_json)
	print("Guardado Exitoso!")

func load_game() :
	var loaded_data : Dictionary
	var file = FileAccess.open(ruta_archivo,FileAccess.READ)
	if file:
		loaded_data = JSON.parse_string(file.get_line())
	
	return loaded_data
