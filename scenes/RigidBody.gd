extends RigidBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

var thrust = Vector2(0, -250)
var torque = 20000
func _ready():
	screen_size = get_viewport_rect().size
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
