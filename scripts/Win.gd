extends Node

func _on_Timer_timeout():
	$Points.text = str(global.point) + " puntos"
	$Points.visible = true
	$Restart.visible = true
