extends Label

func _input(event):
	if visible && event is InputEventMouseButton:
		get_tree().change_scene("res://Game.tscn")
