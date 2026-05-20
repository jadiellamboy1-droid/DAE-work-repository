extends CharacterBody2D

const SPEED = 80.0
var player = null
var can_damage = true

func _ready():
	add_to_group("enemies")

func _physics_process(_delta):
	if player == null:
		player = get_tree().get_first_node_in_group("player")
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * SPEED
		move_and_slide()
		rotation = (player.global_position - global_position).angle()
		if global_position.distance_to(player.global_position) < 55 and can_damage:
			can_damage = false
			player.take_damage()
			queue_free()

func die():
	get_parent().add_score()
	queue_free()
