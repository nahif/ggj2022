extends Node2D

var random
var times = [
	0.5,
	0.5,
	1,
	1.5,
	2
]

func _ready():
	random = RandomNumberGenerator.new()
	random.randomize()

func _on_JumpTimer_timeout():
	$PinguWallR.jump()
	$PinguWallL.jump()
	var _times = times
	if $PinguWallL.position.x < $PositionMinWall.position.x:
		_times = _times.slice(0, 3)
	elif $PinguWallR.position.x > $PositionMaxWall.position.x:
		_times = _times.slice(1, 4)
	$JumpTimer.start(_times[randi() % _times.size()])
