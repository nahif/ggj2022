extends Node

var game = preload("res://Game.tscn")
var tutorial = preload("res://Tutorial.tscn")

var point = 0
var max_score = 0
var perfect = false

func go_to_scene_game():
	perfect = false
	var _cs1 = get_tree().change_scene_to(game)

func go_to_scene_tutorial():
	var _cs1 = get_tree().change_scene_to(tutorial)

func set_point(value):
	point = value
	if max_score < point:
		max_score = point

func _input(event):
	if event.is_action_pressed("ui_reset"):
		go_to_scene_game()
