extends Control


@onready var click_sound = load("res://assets/sfx/click.mp3")
@onready var sfx_player = AudioStreamPlayer.new()

func _on_play_pressed():
	sfx_player.stream = click_sound
	sfx_player.play()
	get_tree().change_scene_to_file("res://game_scene.tscn")
	

func _on_quit_pressed():
	sfx_player.stream = click_sound
	sfx_player.play()
	get_tree().quit()


func _on_audio_stream_player_finished():
	pass # Replace with function body.


func _on_options_pressed():
	sfx_player.stream = click_sound
	sfx_player.play()
	get_tree().change_scene_to_file("res://options.tscn")
	
@export
var audio_queue = [
	load("res://assets/music/track1.mp3"),
	load("res://assets/music/track2.mp3"),
	load("res://assets/music/track3.mp3"),
	load("res://assets/music/track4.mp3")
]
var audio_player

func _ready():
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.bus = "music"
	play_next_sound()
	sfx_player.bus = "sfx"
	add_child(sfx_player)
func play_next_sound():
	if audio_queue.size() > 0:
		audio_player.stream = audio_queue.pop_front()
		audio_player.play()

func _on_audio_finished():
	play_next_sound()
