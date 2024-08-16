extends Area2D

@onready var texture_rect = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print(body)
	texture_rect.texture = load("res://assets/img/door_open.jpeg")
	print("door open")
	await get_tree().create_timer(2.0).timeout
	texture_rect.texture = load("res://assets/img/door_closed.jpeg")
