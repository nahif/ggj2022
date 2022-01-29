extends Node2D

var constant_velocity = Vector2.LEFT * 60
var velocity = 600
var inertia = 9
var timer_init = 0.9
var vel : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.autostart = true
	timer.start(1)
	timer.connect("timeout", self, "_jump")
	add_child(timer)
	pass # Replace with function body.

func _jump():
	vel = Vector2.RIGHT * velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position + constant_velocity * delta + vel * delta
	if vel.length() > 0:
		vel = vel - (vel * inertia * delta)
	pass


func _on_PinguDad_area_exited(area):
	pass # Replace with function body.
