extends Node2D

var constant_velocity = Vector2.LEFT * 60
var velocity = 600
var inertia = 9
var vel : Vector2
var second_animation_offset = 485 
export(bool) var is_right

func _ready():
	if is_right:
		$AnimatedSprite2.position.x += second_animation_offset
	else:
		$AnimatedSprite2.position.x -= second_animation_offset

func jump():
	$AnimatedSprite.play("jump")
	vel = Vector2.RIGHT * velocity

func _process(delta):
	position = position + constant_velocity * delta + vel * delta
	if vel.length() > 0:
		vel = vel - (vel * inertia * delta)

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("idle")

func _on_PinguWallL_area_entered(area):
	if is_right:
		$AnimatedSprite.play("hitR")
	else:
		$AnimatedSprite.play("hitL")
