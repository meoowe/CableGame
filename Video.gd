extends Control

@onready var res = $Label6
var sel_res: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
