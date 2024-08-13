extends Node

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
