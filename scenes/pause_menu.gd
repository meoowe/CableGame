extends Control


@onready var main = $"../"

func _on_resume_pressed() -> void:
	SfxManager.play()
	main.pauseMenu()


func _on_quit_pressed() -> void:
	SfxManager.play()
	get_tree().change_scene_to_file("res://scenes/title.tscn")
