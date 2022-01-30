extends Node

var life = 4
var winScene = preload("res://Win.tscn")
var gameover = false

func _ready():
	$Music.play()
	$PinguMomScene/PinguMom.connect("new_point", self, "_on_points_change")
	$PinguMomScene/PinguMom.connect("damage", self, "_on_get_damage")
	$PinguDadScene/PinguDad.connect("is_been_damage", self,"_on_get_damage" )
	set_process(false)

func _process(delta):
	$BlackScreen.modulate.a += delta * 0.6

func _on_Music_finished():
	global.point = $PinguMomScene/PinguMom.points
	remove_child($PinguDadScene)
	remove_child($PinguMomScene)
	get_tree().change_scene("res://Win.tscn")

func _on_points_change(value: int):
	$Puntaje.text = "puntaje: " + str(value)

func _on_get_damage():
	life -= 1
	if life >= 0:
		$Vida.text = "X" + str(life)
	if !gameover:
		_has_game_over()

func _has_game_over():
	if life < 0:
		gameover = true
		global.point = $PinguMomScene/PinguMom.points
		$Timer.start(2)
		set_process(true)

func _on_Timer_timeout():
	get_tree().change_scene("res://GameOver.tscn")
