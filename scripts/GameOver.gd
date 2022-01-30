extends Node

var speed = 0.25

func _ready():
	$PantallaPerder.modulate.a = 1

func _process(delta):
	$PantallaPerder.modulate.a -= delta * speed
	if $PantallaPerder.modulate.a <= 0:
		$Points.text = str(global.point) + " puntos"
		$Restart.visible = true
