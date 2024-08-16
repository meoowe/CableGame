extends Control

@onready var res = $Label6
var sel_res: String
# Resolutions
const res1 = "2560x1440"
const res2 = "1920x1080"
const res3 = "1600x900"
const res4 = "1280x720"

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
	play_next_sound()

func play_next_sound():
	if audio_queue.size() > 0:
		audio_player.stream = audio_queue.pop_front()
		audio_player.play()

func _on_audio_finished():
	play_next_sound()

func set_res(res:String):
	DisplayServer.window_set_size(Vector2i(res.split("x")[0].to_int(), res.split("x")[1].to_int()))

func set_text(text:String):
	res.text = text
# Back Button
func _on_button_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_texture_button_pressed():
	SfxManager.play()
	set_res(res1)
	set_text(res1)

func _on_texture_button_2_pressed():
	SfxManager.play()
	set_text(res2)
	set_res(res2)


func _on_texture_button_3_pressed():
	SfxManager.play()
	set_text(res3)
	set_res(res3)


func _on_texture_button_4_pressed():
	SfxManager.play()
	set_text(res4)
	set_res(res4)
