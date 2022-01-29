extends Node2D

var max_position: int
var min_position: int
var render_position : int
var points = 0

var fishes = []

var offset = 100

var random



# Called when the node enters the scene tree for the first time.
func _ready():
	max_position = get_node("../PositionMaxHeight").position.y 
	min_position = get_node("../PositionMinHeight").position.y
	render_position = get_node("../PositionRender").position.x
	
	fishes.append($Fish1)
	fishes.append($Fish3)
	fishes.append($Fish5)
	
	random = RandomNumberGenerator.new()
	random.randomize()
	randomize()


func _on_Timer_timeout():
	_create_fish()
	pass # Replace with function body.

func _create_fish():
	var new_fish = fishes[randi() % fishes.size()].duplicate()
	new_fish.start(Vector2(render_position, random.randi_range(min_position, max_position)))
	add_child(new_fish)
