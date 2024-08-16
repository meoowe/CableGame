extends StaticBody2D

@onready var table = $"../table"


func _on_player_it_room():
	hide()
	table.hide()



func _on_player_office():
	show()
	table.show()


func _on_player_deafult():
	hide()
	table.hide()
