extends Node

var speed = 40
var direction = Vector2.DOWN

func _ready():
	$Start.modulate.a = 0.9

func _process(delta):
	$Start.rect_position += direction * speed * delta
	if direction.y == 1 && $Start.rect_position.y > $PositionDown.position.y:
		direction = Vector2.UP
	if direction.y == -1 && $Start.rect_position.y < $PositionUp.position.y:
		direction = Vector2.DOWN

func _input(event):
	if event.is_action_pressed("ui_accept") || event.is_action_pressed("ui_select"):
		$bep.play()
		global.go_to_scene_game()

func _on_VideoPlayer_finished():
	$VideoPlayer.play()

func _on_Start_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		global.go_to_scene_game()

func _on_Start_mouse_entered():
	$Start.modulate.a = 1
	$bep.play()

func _on_Start_mouse_exited():
	$Start.modulate.a = 0.9
