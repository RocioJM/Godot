extends Node2D

@onready var ball : RigidBody2D = get_tree().get_first_node_in_group("ball")
@onready var NumScore : Label = $NumLevel
@onready var NumLevel : Label = $NumScore

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_Salir_boton_pressed():
	#get_tree().paused = false
	get_tree().quit()

func _on_Replay_boton_pressed():
	#get_tree().paused = false
	get_tree().change_scene_to_file("res://world.tscn")

func _on_boton_guardar_pressed():
	FileUtils.save_game(str(NumLevel.get_text()), str(NumScore.get_text()))
