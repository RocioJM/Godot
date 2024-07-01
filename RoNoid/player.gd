extends CharacterBody2D


@export var SPEED : int = 6
const JUMP_VELOCITY = -400.0

#Variables mias
const right : int = 1
const left : int = -1

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 0


func _physics_process(delta):
	if Input.is_action_pressed("mov_derecha"):
		#position.x = position.x + SPEED	
		var movement : Vector2 = Vector2(SPEED,0)
		move_and_collide(movement)
	if Input.is_action_pressed("mov_izquierda"):
		#position.x = position.x - SPEED	
		var movement : Vector2 = Vector2(-SPEED,0)
		move_and_collide(movement)
		
		
#De esta manera solo se ejecutaria una vez
#func _input(event):
	#if event.is_action_pressed("mov_derecha"):
		#position.x = position.x + SPEED	
	#if event.is_action_pressed("mov_izquierda"):
		#position.x = position.x - SPEED	
		
		
