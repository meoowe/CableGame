extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/title.tscn")

