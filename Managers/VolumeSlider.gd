extends HSlider

@export
var busName: String
var busIndex: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	busIndex = AudioServer.get_bus_index(busName)
	value_changed.connect(_onValueChanged)#
	value = db_to_linear(
		AudioServer.get_bus_volume_db(
			busIndex
		)
	)
@warning_ignore("shadowed_variable_base_class")
func _onValueChanged(value: float) -> void:
	AudioServer.set_bus_volume_db(
		busIndex,
		linear_to_db(value)
	)

