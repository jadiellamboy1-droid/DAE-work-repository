extends Node2D

var enemy_scene = preload("res://enemy.tscn")
var score = 0

func _on_timer_timeout():
	var enemy = enemy_scene.instantiate()
	var side = randi() % 4
	match side:
		0: enemy.position = Vector2(randf_range(-500, 500), -300)
		1: enemy.position = Vector2(randf_range(-500, 500), 300)
		2: enemy.position = Vector2(-500, randf_range(-300, 300))
		3: enemy.position = Vector2(500, randf_range(-300, 300))
	add_child(enemy)

func add_score():
	score += 1
	$CanvasLayer/score.text = "Score: " + str(score)

func update_health(h):
	$CanvasLayer/health.text = "Health: " + str(h)

func go_to_game_over():
	get_tree().change_scene_to_file("res://game_over.tscn")
