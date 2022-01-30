extends Node

var speed = 40
var direction = Vector2.DOWN
var preload_game = preload("res://Game.tscn")

func _ready():
	$Start.modulate.a = 0.9
	pass

func _process(delta):
	$Start.rect_position += direction * speed * delta
	if direction.y == 1 && $Start.rect_position.y > $PositionDown.position.y:
		direction = Vector2.UP
	if direction.y == -1 && $Start.rect_position.y < $PositionUp.position.y:
		direction = Vector2.DOWN

func _on_Start_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		var _c1 = get_tree().change_scene_to(preload_game)

func _on_Start_mouse_entered():
	$Start.modulate.a = 1
	$bep.play()

func _on_Start_mouse_exited():
	$Start.modulate.a = 0.9
