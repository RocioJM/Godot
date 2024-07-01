extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var level : int = 1
var coins : int = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _maybeCoins():
	var num = randi_range(0,100)
	if num >40 :
		coins +=1

func carga_estado() :
	var load_data : Dictionary = FileUtils.load_game()
	if !load_data:
		return
	level = int(load_data.level)
	coins = int(load_data.coins)
	position = Vector2(load_data.positionX, load_data.positionY)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	carga_estado()


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		level +=1
		_maybeCoins()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
