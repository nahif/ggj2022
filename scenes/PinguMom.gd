extends Area2D

var speed = 200
var maxHeight = 0
var minHeight = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	maxHeight = get_node("../PositionMaxHeight").position.y
	minHeight = get_node("../PositionMinHeight").position.y
	
	print(minHeight)
	pass # Replace with function body.


func _physics_process(delta):
	if Input.is_action_pressed("ui_up") && position.y > minHeight:
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down") && position.y < maxHeight:
		position.y += speed * delta
