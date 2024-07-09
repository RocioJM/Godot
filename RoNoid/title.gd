extends Node2D

@onready var fileUtils : Node = get_tree().root.get_node("FileUtils")
@onready var CargarPartidaButton : TextureButton = $Menu/BotonCargarPartida/Boton
@onready var CargarPartidaSprite : Sprite2D = $Menu/BotonCargarPartida/Shadow
@onready var Entorno : Node2D = get_tree().get_first_node_in_group("Environment")

# Called when the node enters the scene tree for the first time.
func _ready():
	var load_data : Dictionary = fileUtils.loadedData()
	if load_data.existe == 0:#No Existe
		CargarPartidaSprite.show()
		CargarPartidaButton.disabled = true
		CargarPartidaSprite.modulate.a8 = 255
	else:#Existe
		fileUtils.level = load_data.level
		fileUtils.score = load_data.score
		CargarPartidaSprite.hide()
		CargarPartidaButton.disabled = false
		CargarPartidaSprite.modulate.a8 = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_boton_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


func _on_Salit_boton_pressed():
	get_tree().quit()

func _on_NuevaPartida_boton_pressed():
	fileUtils.level = 0
	fileUtils.score = 0
	get_tree().change_scene_to_file("res://world.tscn")
