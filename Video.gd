extends Control

@onready var res = $Label6
var sel_res: String

# Called when the node enters the scene tree for the first time.
@export
var audio_queue: Array = [
	load("res://assets/music/track1.mp3"),
	load("res://assets/music/track2.mp3"),
	load("res://assets/music/track3.mp3"),
	load("res://assets/music/track4.mp3")
]
var audio_player: AudioStreamPlayer

func _ready():
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.bus = "music"
	audio_player.finished.connect(_on_audio_finished())
	play_next_sound()
func play_next_sound():
	if audio_queue.size() > 0:
		audio_player.stream = audio_queue.pop_front()
		audio_player.play()

func _on_audio_finished():
	play_next_sound()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_texture_button_pressed():
	SfxManager.play()
	sel_res = "2560x1440"
	res.text = sel_res
	DisplayServer.window_set_size(Vector2i(2560, 1440))


func _on_texture_button_2_pressed():
	SfxManager.play()
	sel_res = "1920x1080"
	res.text = sel_res
	DisplayServer.window_set_size(Vector2i(1920, 1080))


func _on_texture_button_3_pressed():
	SfxManager.play()
	sel_res = "1600x900"
	res.text = sel_res
	DisplayServer.window_set_size(Vector2i(1600, 900))


func _on_texture_button_4_pressed():
	SfxManager.play()
	sel_res = "1280x720"
	res.text = sel_res
	DisplayServer.window_set_size(Vector2i(1280, 720))
