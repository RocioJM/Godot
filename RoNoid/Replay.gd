extends Node2D

@onready var fileUtils : Node = get_tree().root.get_node("FileUtils")
var load_data : Dictionary
@onready var Mensaje : Label = $Mensaje

# Called when the node enters the scene tree for the first time.
func _ready():
	Mensaje.text = ""
	load_data = fileUtils.loadedData()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_Salir_boton_pressed():
	#get_tree().paused = false
	get_tree().quit()

func _on_Replay_boton_pressed():
	#get_tree().paused = false
	get_tree().change_scene_to_file("res://world.tscn")

func _on_boton_guardar_Replay_pressed():
	Mensaje.text = "Partida guardada con exito!"
	FileUtils.save_game(int(fileUtils.level), int(fileUtils.score))
