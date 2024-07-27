extends Node2D

@onready var soundOff = $SoundOff
@onready var soundOn = $SoundOn
@onready var flechaIzquierda = $FlechaIzquierda
@onready var flechaDerecha = $FlechaDerecha
@onready var fd_load = $FDLoad

# Called when the node enters the scene tree for the first time.
func _ready():
	soundOff.disabled = true
	soundOn.disabled = true
	flechaDerecha.disabled = true
	flechaIzquierda.disabled = true
	fd_load.current_dir = "/"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_boton_salir_entorno_pressed():
	get_tree().quit()


func _on_añadir_pressed():
	fd_load.visible = true


func _on_fd_load_file_selected(path):
	if FileAccess.file_exists(path):
		var sound : AudioStreamPlayer2D = AudioStreamPlayer2D.new()
		var audio_stream = ResourceLoader.load(path)
		if audio_stream is AudioStream:
			sound.stream = audio_stream
			add_child(sound) # Añadir el nodo al árbol de la escena
			sound.play()
		else:
			print("El archivo no es un AudioStream válido")
	else:
		print("El archivo no existe")
