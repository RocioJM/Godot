extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Replay_boton_pressed():
	#get_tree().paused = false
	get_tree().change_scene_to_file("res://world.tscn")
	
func _on_Salir_boton_pressed():
	#get_tree().paused = false
	get_tree().quit()
