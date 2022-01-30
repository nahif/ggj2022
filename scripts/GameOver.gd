extends Node

var speed = 0.25

func _ready():
	$PantallaPerder.modulate.a = 1

func _process(delta):
	$PantallaPerder.modulate.a -= delta * speed
	if $PantallaPerder.modulate.a <= 0:
		$Points.text = "score: " + str(global.point)
		$Restart.visible = true

func _input(event):
	if event.is_action_pressed("ui_accept") || event.is_action_pressed("ui_select"):
		$bep.play()
		global.go_to_scene_game()
