extends Node2D

@onready var ball : RigidBody2D = get_tree().get_first_node_in_group("ball")
@onready var NumScore : Label = $Score/NumScore
@onready var NumLevel : Label = $Level/NumLevel
@onready var title : Node = get_tree().root.get_node("FileUtils")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(title != null) : 
		NumScore.set_text(str(title.score))
		NumLevel.set_text(str(title.level))

