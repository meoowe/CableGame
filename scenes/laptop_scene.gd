extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var loginContainer = $HBoxContainer
@onready var popup_menu = $PopupMenu
@onready var username_enter = $HBoxContainer/VBoxContainer/usernameEnter
@onready var password_enter = $HBoxContainer/VBoxContainer/passwordEnter
@onready var correct = $correct
@onready var music_player = $musicPlayer
@onready var sfx_player = $sfxPlayer
@onready var incorrect = $incorrect

const username = "overlord"
const password = "escape"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	music_player.stream = load("res://assets/music/laptop.mp3")
	music_player.play()
func _on_popup_menu_id_pressed(id):
	if id == 1:
		sfx_player.stream = load("res://assets/sfx/powerDown.mp3")
		sfx_player.play()
		print_debug("played")
		await get_tree().create_timer(2.00).timeout
		get_tree().change_scene_to_file("res://scenes/game_scene.tscn")


func _on_power_button_pressed():
	popup_menu.show()


func _on_button_pressed():
	if username_enter.text == username and password_enter.text == password:
		loginContainer.hide()
		correct.show()
	else: 
		incorrect.show()
		await get_tree().create_timer(1.00).timeout
		incorrect.hide()
		
func _on_music_player_finished():
	music_player.play()
