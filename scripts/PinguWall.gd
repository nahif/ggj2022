extends Node2D

var constant_velocity = Vector2.LEFT * 60
var velocity = 600
var inertia = 9
var vel : Vector2
var second_animation_offset = 465 
export(bool) var is_right

func _ready():
	if is_right:
		$AnimatedSprite2.position.x += second_animation_offset
	else:
		$AnimatedSprite2.position.x -= second_animation_offset

func jump():
	$cow.play()
	$AnimatedSprite.play("jump")
	$AnimatedSprite2.play("jump")
	vel = Vector2.RIGHT * velocity

func _process(delta):
	position = position + constant_velocity * delta + vel * delta
	if vel.length() > 0:
		vel = vel - (vel * inertia * delta)

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("idle")
	$AnimatedSprite2.play("idle")

func _on_PinguWallL_area_entered(_area):
	if is_right:
		$AnimatedSprite.play("hitR")
		$AnimatedSprite2.play("hitR")
	else:
		$AnimatedSprite.play("hitL")
		$AnimatedSprite2.play("hitL")
