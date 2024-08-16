extends Control
@export
var audio_queue: Array = [
	load("res://assets/music/track1.mp3"),
	load("res://assets/music/track2.mp3"),
	load("res://assets/music/track3.mp3"),
	load("res://assets/music/track4.mp3")
]
var audio_player: AudioStreamPlayer
var keybinds = createKeybindDict()
@onready var keybind_resource = preload("res://scenes/PlayerKeybindDeafult.tres")
func createKeybindDict() -> Dictionary:
	var keybind_container_dict = {
		keybind_resource.MOVE_LEFT: keybind_resource.move_left_key,
		keybind_resource.MOVE_RIGHT: keybind_resource.move_right_key,
		keybind_resource.MOVE_UP: keybind_resource.move_up_key,
		keybind_resource.MOVE_DOWN: keybind_resource.move_down_key
	}
	return keybind_container_dict
func _ready():
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.bus = "music"
	play_next_sound()
func play_next_sound():
	if audio_queue.size() > 0:
		audio_player.stream = audio_queue.pop_front()
		audio_player.play()

func _on_audio_finished():
	play_next_sound()


func _on_exit_button_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/title.tscn")


func _on_texture_button_2_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/Volume.tscn")


func _on_texture_button_3_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/Video.tscn")


func _on_texture_button_4_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/keybinds.tscn")
