extends Node2D

var random
var min_time = 0.6
var max_time = 1.5

func _ready():
	random = RandomNumberGenerator.new()
	random.randomize()

func _on_JumpTimer_timeout():
	$PinguWallR.jump()
	$PinguWallL.jump()
	$JumpTimer.start(random.randi_range(min_time, max_time))
