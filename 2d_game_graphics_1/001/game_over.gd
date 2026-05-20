extends Control

func setup(score):
	$scorelabel.text = "Score: " + str(score)

func _on_restartbutton_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
