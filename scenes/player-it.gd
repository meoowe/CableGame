extends Area2D
signal office
signal IT_Room
signal Deafult
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@onready var background = $"../background"
@onready var character = $AnimatedSprite2D
@onready var door = $"../Door/TextureRect"


var move_down = true
var move_up = true
var move_left = true
var move_right = true
var newBg: Texture
var index: int = 1
@export var fade_speed = 1
var time = 0
var sinTime = 0
var _visible = true
var flash = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right") and move_right:
		move_left = true
		velocity.x += 1
		character.play("right")
	if Input.is_action_pressed("left")and move_left:
		move_right = true
		velocity.x -= 1
		character.play("left")
	if Input.is_action_pressed("down") and move_down:
		move_up = true
		velocity.y += 1
		character.play("down")
	if Input.is_action_pressed("up")and move_up:
		move_down = true
		velocity.y -= 1
		character.play("up")
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	if index > 3:
		index = 3
	elif index < 1:
		index = 1


func _on_body_entered(body):
	if body.name == "wallLeft" :
		get_tree().change_scene_to_file("res://scenes/it.tscn")
	elif body.name == "wallRight":
		get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
	elif body.name == "ground": 
		position.y -= 10
		move_down = false
	elif body.name == "Door":
		door.texture = load("res://assets/img/door_open.png")
		print("door open")
		await get_tree().create_timer(2.0).timeout
		door.texture = load("res://assets/img/door_closed.png")
		
