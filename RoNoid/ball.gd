extends RigidBody2D

var game_started : bool = false
@onready var lose_snd : AudioStreamPlayer2D = get_node("Lose")
@onready var break_snd : AudioStreamPlayer2D = get_node("Break")
@onready var hit_snd : AudioStreamPlayer2D = get_node("Hit")
@onready var start_snd : AudioStreamPlayer2D = get_node("Start")
@onready var win_snd : AudioStreamPlayer2D = get_node("Win")
var level : int = 0
var score : int = 0

func cargar_estado() :
	var load_data : Dictionary = FileUtils.load_game()
	if !load_data:
		return
	level = int(load_data.level)
	score = int(load_data.coins)
	#position = Vector2(load_data.positionX, load_data.positionY)


# Called when the node enters the scene tree for the first time.
func _ready():
	game_started = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	linear_velocity = Vector2(50,-200)
	for body in get_colliding_bodies():
		if body.is_in_group("gr_blocks"):
			body.queue_free()
			break_snd.play()
			if body.get_parent().get_child_count() == 15 : #gana 1
				level += 1
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
		else:
			hit_snd.play()
			score +=10
			
func _input(event):
	if event.is_action_pressed("iniciar") and game_started:
		linear_velocity = Vector2(50,-200)
		game_started = false
		start_snd.play()
		cargar_estado()

