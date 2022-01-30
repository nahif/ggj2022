extends Area2D

var Fish = load("res://scripts/Fish.gd")
var Enemy = load("res://scripts/Enemy.gd")

var speed = 200
var maxHeight = 0
var minHeight = 0

var life = 100
var damage = 10
var is_damage = false
var damage_time = 2
var actual_damage_time = 0

var points = 0
signal new_point(value)
signal damage

func _ready():
	set_physics_process(true)
	maxHeight = get_node("../PositionMaxHeight").position.y
	minHeight = get_node("../PositionMinHeight").position.y


func _physics_process(delta):
	if Input.is_action_pressed("ui_up") && position.y > minHeight:
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down") && position.y < maxHeight:
		position.y += speed * delta
	if is_damage:
		actual_damage_time -= delta
		visible = !visible
		if actual_damage_time <= 0:
			is_damage = false
			visible = true

func _on_PinguMom_area_entered(area):
	if area is Fish:
		points += area.fishValue
		emit_signal("new_point", points)
	if area is Enemy && !is_damage:
		actual_damage_time = damage_time
		life -= damage
		is_damage = true
		$AnimationSprite.play("hit")
		$wek.play()
		emit_signal("damage")
	area.get_parent().remove_child(area)


func _on_AnimationSprite_animation_finished():
	$AnimationSprite.play("idle")
