extends Area2D
signal hit
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var move_down = true
var move_up = true
var move_left = true
var move_right = true
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right") and move_right:
		move_left = true
		velocity.x += 1
	if Input.is_action_pressed("left")and move_left:
		move_right = true
		velocity.x -= 1
	if Input.is_action_pressed("down") and move_down:
		move_up = true
		velocity.y += 1
	if Input.is_action_pressed("up")and move_up:
		move_down = true
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_body_entered(body):
	if body.name == "wallLeft" :
		print("Change Room Here!")
		move_left = false
	elif body.name == "wallRight":
		print("Change Room Here!")
		position.x -= 1
		move_right = true
	elif body.name == "ground": 
		position.y -= 10
		move_down = false
		

