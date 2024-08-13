extends Control

func _on_exit_button_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/title.tscn")


func _on_texture_button_2_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/Volume.tscn")


func _on_texture_button_3_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/Video.tscn")
