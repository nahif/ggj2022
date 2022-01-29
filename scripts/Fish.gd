extends Area2D

var PinguMom = load("res://scripts/PinguMom.gd")

var speed = 600
var is_moving = false

export(int) var fishValue = 1
export(Texture) var texture

func _ready():
	$Sprite.texture = texture

func start(new_position):
	position = new_position
	is_moving = true

func _process(delta):
	if is_moving:
		position += Vector2.LEFT * speed * delta
		if position.x < 0:
			get_parent().remove_child(self)