extends Node

var ruta_archivo : String = "res://save_game.dat"

var file
var level : int = 0
var score : int = 0

func _ready():
	var loaded_data : Dictionary
	file = FileAccess.open(ruta_archivo,FileAccess.READ)
	if file:
		loaded_data = JSON.parse_string(file.get_line())
		level = int(loaded_data.level)
		score = int(loaded_data.score)
	else:
		file = null

func save_game(level : String, score : String) :
	var data : Dictionary = {
		level = level,
		score = score
	}

	var file = FileAccess.open(ruta_archivo,FileAccess.WRITE)
	var data_json = JSON.stringify(data)
	print(data_json)
	file.store_line(data_json)
	print("Guardado Exitoso!")

func loadedData ():
	return file
