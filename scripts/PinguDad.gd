extends Node2D

var velocity = 167
var damage_jump = 800
var min_velocity = 0.01
var inertia = 9
var vel : Vector2
var actual_constant_velocity = Vector2.LEFT * 60
var constant_velocity = Vector2.LEFT * 60
var actual_idle_speed = 24
var idle_speed = 24
var damage = 10
var life = 100
var is_being_damaged = false
var is_jumping = false

signal is_been_damage

func _input(event):
	if event.is_action_pressed("ui_right") && !is_jumping:
		_add_velocity(Vector2.RIGHT)
	if event.is_action_pressed("ui_left") && !is_jumping:
		_add_velocity(Vector2.LEFT)

func _add_velocity(direction : Vector2):
	is_jumping = true
	
	# el salto hacia adelante es tres veces el salto hacia atras
	vel = direction * velocity * (2 + direction.x)
	
	# al saltar va agarrando velocidad
	actual_constant_velocity += direction * 30
	actual_idle_speed += direction.x * 5
	$AnimatedSprite.frames.set_animation_speed("idle", actual_idle_speed)
	$AnimatedSprite.play("jump")
	$pandero.play()
	$AnimatedSprite.frame = 0

func _process(delta):
	position = position + actual_constant_velocity * delta
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
	actual_constant_velocity = constant_velocity
	actual_idle_speed = idle_speed
	$AnimatedSprite.frames.set_animation_speed("idle", idle_speed)
	$AnimatedSprite.play("hit")
	$wek.play()
	$huevo.play()
	emit_signal("is_been_damage")

func _on_AnimatedSprite_animation_finished():
	is_jumping = false
	if $AnimatedSprite.animation != "idle":
		$AnimatedSprite.play("idle")
