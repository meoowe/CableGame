extends Node2D
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused
var audio_queue: Array = [
	load("res://assets/music/IT.mp3"),
]
var audio_player: AudioStreamPlayer
@export var fade_duration: int = 5.0
@onready var pause_menu: Control = $PauseMenu
var paused = false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		paused = true
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


func _on_back_pressed():
	SfxManager.play()
	pauseMenu()
	paused = true
