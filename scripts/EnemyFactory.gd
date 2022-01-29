extends Node2D

var max_position: int
var min_position: int
var render_position : int
var points = 0

var enemies = []

var offset = 100
var random

func _ready():
	max_position = get_node("../PositionMaxHeight").position.y 
	min_position = get_node("../PositionMinHeight").position.y
	render_position = get_node("../PositionRender").position.x
	
	enemies.append($Enemy)
	
	random = RandomNumberGenerator.new()
	random.randomize()
	randomize()

func _create_enemy():
	var new_enemy = enemies[randi() % enemies.size()].duplicate()
	new_enemy.start(Vector2(render_position, random.randi_range(min_position, max_position)))
	add_child(new_enemy)

func _on_Timer_timeout():
	_create_enemy()
