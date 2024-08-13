extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play():
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.bus = "sfx"
	player.stream = load("res://assets/sfx/click.mp3")
	player.play()
	await get_tree().create_timer(0.500).timeout
