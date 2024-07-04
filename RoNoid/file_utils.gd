extends Node

var ruta_archivo : String = "res://save_game.dat"

#func save_game(level : Label, score : Label, ball : RigidBody2D) :
func save_game(level : String, score : String) :
	var data : Dictionary = {
		#level = level.get_text(),
		#score = score.get_text(),
		#positionX = ball.position.x,
		#positionY = ball.position.y,
		level = level,
		score = score
	}

	var file = FileAccess.open(ruta_archivo,FileAccess.WRITE)
	var data_json = JSON.stringify(data)
	print(data_json)
	file.store_line(data_json)
	print("Guardado Exitoso!")

func load_game() :
	var loaded_data : Dictionary
	var file = FileAccess.open(ruta_archivo,FileAccess.READ)
	if file:
		loaded_data = JSON.parse_string(file.get_line())
	
	return loaded_data
