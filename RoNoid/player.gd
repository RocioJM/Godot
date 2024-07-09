extends CharacterBody2D

@export var SPEED : int = 6
const JUMP_VELOCITY = -400.0

#Variables mias
const right : int = 1
const left : int = -1

#@onready var ball : RigidBody2D = get_tree().get_first_node_in_group("ball")
@onready var leftButton : TextureButton = $LeftButton
@onready var rightButton : TextureButton = $RightButton

var botonLeftPulsado : bool = false
var botonRightPulsado : bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 0

func _physics_process(delta):
	if Input.is_action_pressed("mov_derecha") or botonRightPulsado:
		#position.x = position.x + SPEED	
		var movement : Vector2 = Vector2(SPEED,0)
		move_and_collide(movement)
	if Input.is_action_pressed("mov_izquierda") or botonLeftPulsado:
		#position.x = position.x - SPEED	
		var movement : Vector2 = Vector2(-SPEED,0)
		move_and_collide(movement)

func _ready():
	pass

func _on_right_button_button_down():
	botonLeftPulsado = false
	botonRightPulsado = true

func _on_right_button_button_up():
	botonLeftPulsado = false
	botonRightPulsado = false


func _on_left_button_button_down():
	botonLeftPulsado = true
	botonRightPulsado = false

func _on_left_button_button_up():
	botonLeftPulsado = false
	botonRightPulsado = false
