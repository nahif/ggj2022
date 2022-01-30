extends Label

func _ready():
	modulate.a = 0.9

func _on_Restart_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		var _c1 = get_tree().change_scene("res://Game.tscn")

func _on_Restart_mouse_exited():
	modulate.a = 0.9

func _on_Restart_mouse_entered():
	modulate.a = 1
	$bep.play()
