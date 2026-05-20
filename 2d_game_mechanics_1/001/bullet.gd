extends Area2D

const SPEED = 600.0
var direction = Vector2.ZERO

func _process(delta):
	position += direction * SPEED * delta

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body.die()
		queue_free()

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
