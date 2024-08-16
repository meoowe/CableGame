extends Label

@export var fade_speed = 1
var time = 0
var sinTime = 0
var _visible = true
var flash = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func flash_text():
	if flash:
		_visible = true
		modulate.a = sinTime
	pass
func _physics_process(delta):
	time += delta
	sinTime = sin(time*fade_speed)
	flash_text()
	


func _on_player_office():
	text = "Room 1: The Office"
	flash = true
	await get_tree().create_timer(8.0).timeout
	flash = false


func _on_player_it_room():
	text = "Room 2: The IT Closet"
	flash = true
	await get_tree().create_timer(8.0).timeout
	flash = false
 
