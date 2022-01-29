extends Node

func _ready():
	$Music.play()
	$PinguMomScene/PinguMom.connect("new_point", self, "_on_points_change")
	$PinguMomScene/PinguMom.connect("damage", self, "_on_mom_damage")
	$PinguDadScene/PinguDad.connect("is_been_damage", self,"_on_been_damage" )
	
func _on_Music_finished():
	var points = $PinguMomScene/PinguMom.points
	remove_child($PinguDadScene)
	remove_child($PinguMomScene)
	$PuntajeFinal.text = "puntaje " + str(points)
	$PuntajeFinal.visible = true

func _on_points_change(value: int):
	$Puntaje.text = "puntaje: " + str(value)

func _on_been_damage(value: int):
	$VidaDad.text = "vida padre: " + str(value) + "/100"
	_has_game_over(value)

func _on_mom_damage(value : int):
	$VidaMom.text = "vida madre: " + str(value) + "/100"
	_has_game_over(value)

func _has_game_over(value : int):
	if value <= 0:
		remove_child($PinguDadScene)
		remove_child($PinguMomScene)
		$PuntajeFinal.text = "GAME OVER"
		$PuntajeFinal.visible = true
