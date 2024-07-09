extends Node

#var ruta_archivo : String = "./savegame.dat"
var ruta_archivo : String = "user://savedata.txt"

var file : FileAccess
var level : int = 0
var score : int = 0
var existe : int = 0

func _ready():
	var loaded_data : Dictionary
	if FileAccess.file_exists(ruta_archivo):
		file = FileAccess.open(ruta_archivo, FileAccess.READ)
		if file:
			var line = file.get_line()
			var result = JSON.parse_string(line)
			if result and result.has("error") and result.error == OK:
				loaded_data = result.result
				level = int(loaded_data.get("level"))
				score = int(loaded_data.get("score"))
				existe = int(loaded_data.get("existe"))
			file.close()
	else:
		save_initial_data()

func save_initial_data():
	file = FileAccess.open(ruta_archivo, FileAccess.WRITE)
	var data : Dictionary = {
		"level": level,
		"score": score,
		"existe": 0
	}
	var data_json = JSON.stringify(data)
	file.store_line(data_json)
	file.close()

func save_game(level : int, score : int):
	var data : Dictionary = {
		"level": level,
		"score": score,
		"existe": 1
	}
	file = FileAccess.open(ruta_archivo, FileAccess.WRITE)
	var data_json = JSON.stringify(data)
	file.store_line(data_json)
	file.close()

func loadedData():
	var loaded_data : Dictionary
	var file = FileAccess.open(ruta_archivo,FileAccess.READ)
	if file:
		loaded_data = JSON.parse_string(file.get_line())
	
	return loaded_data
