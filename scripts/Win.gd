extends Node

func _ready():
	if global.perfect:
		$PantallaGanar2.texture = load("res://assets/sprites/pantallas/perfect.png")
		$Points.rect_position.y = 190
		$Points.visible = false

func _on_Timer_timeout():
	$Points.text = str(global.point) + " puntos"
	$Points.visible = true
	$Restart.visible = true
