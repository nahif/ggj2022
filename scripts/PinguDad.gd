extends Node2D

var velocity = 500
var min_velocity = 0.01
var inertia = 9
var vel : Vector2
var constant_velocity = Vector2.LEFT * 60

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_right"):
		_add_velocity(Vector2.RIGHT)
	if event.is_action_pressed("ui_left"):
		_add_velocity(Vector2.LEFT)

func _add_velocity(direction : Vector2):
	vel = direction * velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.position = $Sprite.position + constant_velocity * delta
	if vel.length() > min_velocity:
		$Sprite.position = $Sprite.position + vel * delta
		vel = vel - (vel * inertia * delta)
	pass
