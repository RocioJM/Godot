extends Node2D

@onready var fileUtils : Node = get_tree().root.get_node("FileUtils")
#@onready var nuevaPartidaBoton : TextureButton = $Menu/NuevaPartida/Boton
#@onready var nuevaPartida : Node2D = $Menu/NuevaPartida
@onready var CargarPartidaButton : TextureButton = $Menu/BotonCargarPartida/Boton
@onready var CargarPartidaSprite : Sprite2D = $Menu/BotonCargarPartida/Shadow

# Called when the node enters the scene tree for the first time.
func _ready():
	if !fileUtils.loadedData():
		CargarPartidaSprite.show()
		CargarPartidaButton.disabled = true
		CargarPartidaSprite.modulate.a8 = 255
	else:
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
