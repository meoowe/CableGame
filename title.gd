extends Control

func _on_play_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
	

func _on_quit_pressed():
	SfxManager.play()
	get_tree().quit()


func _on_options_pressed():
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/options.tscn")
	
