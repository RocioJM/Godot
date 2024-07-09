extends Node2D

@onready var NumScore : Label = $Score/NumScore
@onready var NumLevel : Label = $Level/NumLevel
@onready var fileUtils : Node = get_tree().root.get_node("FileUtils")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(fileUtils != null) :
		NumScore.set_text(str(fileUtils.score))
		NumLevel.set_text(str(fileUtils.level))

