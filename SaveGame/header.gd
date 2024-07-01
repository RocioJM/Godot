extends ColorRect

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var level : Label = $Level/NumLevel
@onready var coins : Label = $Coins/NumCoins

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	level.text = str(player.level)
	coins.text = str(player.coins)


func _on_button_pressed():
	FileUtils.save_game(level, coins, player)
