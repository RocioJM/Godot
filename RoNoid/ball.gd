extends RigidBody2D

var game_started : bool = false
@onready var lose_snd : AudioStreamPlayer2D = get_node("Lose")
@onready var break_snd : AudioStreamPlayer2D = get_node("Break")
@onready var hit_snd : AudioStreamPlayer2D = get_node("Hit")
@onready var start_snd : AudioStreamPlayer2D = get_node("Start")
@onready var win_snd : AudioStreamPlayer2D = get_node("Win")

# Called when the node enters the scene tree for the first time.
func _ready():
	game_started = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for body in get_colliding_bodies():
		if body.is_in_group("gr_blocks"):
			body.queue_free()
			break_snd.play()
			if body.get_parent().get_child_count() == 1 : #gana
				win_snd.play()
				queue_free()
		elif body.name == "BorderBottom": #pierde
			#get_tree().paused = true
			lose_snd.play()
			queue_free()
			var replay_scene = load("res://Replay.tscn")
			get_parent().add_child(replay_scene.instantiate())
		else:
			hit_snd.play()
			
func _input(event):
	if event.is_action_pressed("iniciar") and game_started:
		linear_velocity = Vector2(50,-200)
		game_started = false
		start_snd.play()
	
