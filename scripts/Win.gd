extends Node

func _ready():
	if global.perfect:
		$PantallaGanar2.texture = load("res://assets/sprites/pantallas/perfect.png")
		$Points.rect_position.y = 190
		$Points.visible = false

func _on_Timer_timeout():
	$Points.text = "score: " + str(global.point)
	$Points.visible = true
	$Restart.visible = true

func _input(event):
	if event.is_action_pressed("ui_accept") || event.is_action_pressed("ui_select"):
		$bep.play()
		global.go_to_scene_game()
