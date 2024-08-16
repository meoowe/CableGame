
extends Node

func _process(delta):
	ImGui.Begin("My Window")
	ImGui.Text("hello from GDScript")
	ImGui.End()
