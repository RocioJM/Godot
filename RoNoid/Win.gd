extends Node2D

#@onready var ball : RigidBody2D = get_tree().get_first_node_in_group("ball")
@onready var NumLevel : Label = $NumLevel
@onready var NumScore : Label = $NumScore
@onready var Mensaje : Label = $Mensaje
@onready var fileUtils : Node = get_tree().root.get_node("FileUtils")
#var load_data : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	Mensaje.text = ""
	#load_data = fileUtils.loadedData()
	#NumScore.set_text(str(load_data.score))
	#NumLevel.set_text(str(load_data.level))
	NumScore.set_text(str(fileUtils.score))
	NumLevel.set_text(str(fileUtils.level))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Salir_boton_pressed():
	#get_tree().paused = false
	get_tree().quit()
	
func _on_Continuar_boton_pressed():
	#get_tree().paused = false
	get_tree().change_scene_to_file("res://world.tscn")

func _on_boton_guardar_pressed():
	Mensaje.text = "Partida guardada con exito!"
	FileUtils.save_game(int(fileUtils.level), int(fileUtils.score))
