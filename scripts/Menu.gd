extends Node

var speed = 40
var direction = Vector2.DOWN

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton || event is InputEventKey:
		get_tree().change_scene("res://Game.tscn")

func _process(delta):
	$Start.rect_position += direction * speed * delta
	if direction.y == 1 && $Start.rect_position.y > $PositionDown.position.y:
		direction = Vector2.UP
	if direction.y == -1 && $Start.rect_position.y < $PositionUp.position.y:
		direction = Vector2.DOWN
