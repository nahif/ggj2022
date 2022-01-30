extends Node2D

var random
var times = [
	0.5,
	0.5,
	0.75,
	1,
	1.25,
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
		_times = _times.slice(0, 4)
	elif $PinguWallR.position.x > $PositionMaxWall.position.x:
		_times = _times.slice(2, 6)
	$JumpTimer.start(_times[randi() % _times.size()])
