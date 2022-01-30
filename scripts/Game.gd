extends Node

var life = 4
export(int) var max_life = 4
var gameover = false

func _ready():
	$Music.play()
	life = max_life
	# se incluyen variables para sacar los warnings
	var _c1 = $PinguMomScene/PinguMom.connect("new_point", self, "_on_points_change")
	var _c2 = $PinguMomScene/PinguMom.connect("damage", self, "_on_get_damage")
	var _c3 = $PinguDadScene/PinguDad.connect("is_been_damage", self,"_on_get_damage" )
	set_process(false)

func _process(delta):
	$BlackScreen.modulate.a += delta * 0.6

func _on_Music_finished():
	global.point = $PinguMomScene/PinguMom.points
	if life == max_life:
		global.perfect = true
	remove_child($PinguDadScene)
	remove_child($PinguMomScene)
	var _cs1 = get_tree().change_scene("res://Win.tscn")

func _on_points_change(value: int):
	$Puntaje.text = "score: " + str(value)

func _on_get_damage():
	life -= 1
	if life >= 0:
		$Vida.text = "X" + str(life)
	if !gameover:
		_has_game_over()

func _has_game_over():
	if life < 0:
		gameover = true
		$Timer.start(2)
		set_process(true)

func _on_Timer_timeout():
	global.point = $PinguMomScene/PinguMom.points
	var _c1 = get_tree().change_scene("res://GameOver.tscn")

