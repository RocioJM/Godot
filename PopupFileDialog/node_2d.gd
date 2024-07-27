extends Node2D

@onready var fd_save = $fd_save
@onready var fd_load = $fd_load

var player_data : Dictionary = {
	name = "Link",
	health = 15,
	inventory = {
		weapon = ["Magic sword", "Bomb"],
		food = {
			potatoes = 4,
			tofu = 5
		}
	}
}
# Called when the node enters the scene tree for the first time.
func _ready():
	fd_save.current_dir = "/"
	fd_load.current_dir = "/"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fd_save_file_selected(path):
	var save_file = FileAccess.open(path,FileAccess.WRITE)
	if FileAccess.file_exists(path):
		#save_file.store_line("Hello world")
		var player_data_json_string = JSON.stringify(player_data)
		save_file.store_line(player_data_json_string)


func _on_fd_load_file_selected(path):
	var load_file = FileAccess.open(path,FileAccess.READ)
	if FileAccess.file_exists(path):
		#print(load_file.get_line())
		var raw_jsonstring = load_file.get_line()
		var loaded_playerdata : Dictionary = JSON.parse_string(raw_jsonstring)
		print(loaded_playerdata)


func _on_save_button_pressed():
	fd_save.visible = true


func _on_load_button_pressed():
	fd_load.visible = true
