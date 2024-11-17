extends Node2D

@onready var timer: Timer = $Timer
@onready var loadingBar : AnimatedSprite2D = $LoadingBar
@onready var foto : TextureRect = $Papis
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var fadeInTerminado : bool = false
@onready var sndFondo : AudioStreamPlayer = $SonidoFondo

# Called when the node enters the scene tree for the first time.
func _ready():
	# Iniciar el temporizador con 1 segundo de espera
	sndFondo.play()
	timer.start(1.0)
	loadingBar.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !loadingBar.is_playing():
		foto.visible = true
	
	if foto.visible and foto.modulate.a <1:
		foto.modulate.a = foto.modulate.a + (delta/2)


func _on_loading_bar_animation_finished():
	loadingBar.stop()
	loadingBar.visible = false
	fade_in_image()

func fade_in_image():
	# Asegúrate de que la imagen comienza invisible
	foto.modulate.a = 0.0
	foto.visible = true

