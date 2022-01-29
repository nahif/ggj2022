extends Sprite

export var speed = 10

func _ready():
	# solo para los exports
	pass

func _process(delta):
	position.x -= speed * delta
	if position.x <= -1100:
		position.x += 1100 * 2
