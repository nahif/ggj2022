extends Node2D

var velocity = 500
var damage_jump = 700
var min_velocity = 0.01
var inertia = 9
var vel : Vector2
var constant_velocity = Vector2.LEFT * 60
var damage = 10
var life = 100
var is_being_damaged = false

signal is_been_damage(actual_life)

func _input(event):
	if event.is_action_pressed("ui_right"):
		_add_velocity(Vector2.RIGHT)
	if event.is_action_pressed("ui_left"):
		_add_velocity(Vector2.LEFT)

func _add_velocity(direction : Vector2):
	vel = direction * velocity
	$AnimatedSprite.play("jump")
	$AnimatedSprite.frame = 0

func _process(delta):
	position = position + constant_velocity * delta
	if vel.length() > min_velocity:
		position = position + vel * delta
		vel = vel - (vel * inertia * delta)
	pass

func _on_PinguDad_area_entered(area):
	if area.position.x > position.x:
		vel = Vector2.LEFT * damage_jump
	else:
		vel = Vector2.RIGHT * damage_jump
	life -= damage
	$AnimatedSprite.play("hit")
	emit_signal("is_been_damage", life)

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "idle":
		$AnimatedSprite.play("idle")
