extends Node2D

@onready var ball : RigidBody2D = get_tree().get_first_node_in_group("ball")
@onready var NumScore : Label = $Score/NumScore
@onready var NumLevel : Label = $Level/NumLevel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(ball != null) : 
		NumScore.set_text(str(ball.score))
		NumLevel.set_text(str(ball.level))


func _on_boton_guardar_pressed():
	#FileUtils.save_game(NumLevel, NumScore, ball)
	FileUtils.save_game(str(NumLevel.get_text()), str(NumScore.get_text()))

