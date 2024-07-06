extends RigidBody2D

var game_started : bool = false
@onready var lose_snd : AudioStreamPlayer2D = get_node("Lose")
@onready var break_snd : AudioStreamPlayer2D = get_node("Break")
@onready var hit_snd : AudioStreamPlayer2D = get_node("Hit")
@onready var start_snd : AudioStreamPlayer2D = get_node("Start")
@onready var win_snd : AudioStreamPlayer2D = get_node("Win")
#@onready var title : Node2D = get_tree().get_first_node_in_group("Title")
@onready var title : Node = get_tree().root.get_node("FileUtils")

# Called when the node enters the scene tree for the first time.
func _ready():
	game_started = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for body in get_colliding_bodies():
		if body.is_in_group("gr_blocks"):
			body.queue_free()
			break_snd.play()
			if body.get_parent().get_child_count() == 1 : #gana 1
				title.level += 1
				title.score +=10
				win_snd.play()
				queue_free()
				var win_scene = load("res://Win.tscn")
				get_parent().add_child(win_scene.instantiate())
		elif body.name == "BorderBottom": #pierde
			#get_tree().paused = true
			lose_snd.play()
			queue_free()
			var replay_scene = load("res://Replay.tscn")
			get_parent().add_child(replay_scene.instantiate())
		elif body.name == "Player":
			title.score +=10
			linear_velocity = Vector2(50,-200)
		else:
			hit_snd.play()
			
func iniciarPartida():
	if game_started:
		linear_velocity = Vector2(50,-200)
		game_started = false
		start_snd.play()

func _input(event):
	if event.is_action_pressed("iniciar") :
		iniciarPartida()

