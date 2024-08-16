class_name PlayerKeybindResource
extends Node

const MOVE_LEFT:String = "left"
const MOVE_RIGHT:String = "right"
const MOVE_UP:String = "up"
const MOVE_DOWN:String = "down"

@export var MOVE_LEFT_DEAFULT_KEY = InputEventKey.new()
@export var MOVE_RIGHT_DEAFULT_KEY = InputEventKey.new()
@export var MOVE_UP_DEAFULT_KEY = InputEventKey.new()
@export var MOVE_DOWN_DEAFULT_KEY = InputEventKey.new()

var move_left_key = InputEventKey.new()
var move_right_key = InputEventKey.new()
var move_up_key = InputEventKey.new()
var move_down_key = InputEventKey.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
