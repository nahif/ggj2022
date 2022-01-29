extends Node2D

var velocity = 500
var damage_jump = 250
var min_velocity = 0.01
var inertia = 9
var vel : Vector2
var constant_velocity = Vector2.LEFT * 60
var damage = 10
var life = 100
var is_being_damaged = false


func _input(event):
	if event.is_action_pressed("ui_right"):
		_add_velocity(Vector2.RIGHT)
	if event.is_action_pressed("ui_left"):
		_add_velocity(Vector2.LEFT)

func _add_velocity(direction : Vector2):
	vel = direction * velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position + constant_velocity * delta
	if vel.length() > min_velocity:
		position = position + vel * delta
		vel = vel - (vel * inertia * delta)
	if is_being_damaged:
		life -= damage * delta
		print(life)
	pass

func _on_PinguDad_area_entered(area):
	is_being_damaged = true
	if area.position.x > position.x:
		vel = Vector2.LEFT * damage_jump
	else:
		vel = Vector2.RIGHT * damage_jump
	pass # Replace with function body.


func _on_PinguDad_area_exited():
	# Falta agregar si es dañado por los dos lados, aunque no deberia pasar jhafds
	is_being_damaged = false
	pass # Replace with function body.
