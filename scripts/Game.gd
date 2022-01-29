extends Node

var life = 5
var winScene = preload("res://Win.tscn")

func _ready():
	$Music.play()
	$PinguMomScene/PinguMom.connect("new_point", self, "_on_points_change")
	$PinguMomScene/PinguMom.connect("damage", self, "_on_get_damage")
	$PinguDadScene/PinguDad.connect("is_been_damage", self,"_on_get_damage" )
	
func _on_Music_finished():
	global.point = $PinguMomScene/PinguMom.points
	remove_child($PinguDadScene)
	remove_child($PinguMomScene)
	get_tree().change_scene("res://Win.tscn")

func _on_points_change(value: int):
	$Puntaje.text = "puntaje: " + str(value)

func _on_get_damage():
	life -= 1
	$Vida.text = "vida: " + str(life)
	_has_game_over()

func _has_game_over():
	if life <= 0:
		get_tree().change_scene("res://GameOver.tscn")
