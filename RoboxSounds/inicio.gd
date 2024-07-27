extends Node2D

@onready var onichanSnd : AudioStreamPlayer2D = get_node("HiOnichan")
var reproduced : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	onichanSnd.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not onichanSnd.playing and reproduced :
		get_tree().change_scene_to_file("res://entorno.tscn")
	else:
		reproduced = true
