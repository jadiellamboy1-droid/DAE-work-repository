extends CharacterBody2D

const SPEED = 400.0
var bullet_scene = preload("res://bullet.tscn")
var health = 3

func _physics_process(_delta):
	var direction = Vector2.ZERO
	if Input.is_key_pressed(KEY_D): direction.x += 1
	if Input.is_key_pressed(KEY_A): direction.x -= 1
	if Input.is_key_pressed(KEY_S): direction.y += 1
	if Input.is_key_pressed(KEY_W): direction.y -= 1
	velocity = direction.normalized() * SPEED
	move_and_slide()
	var mouse = get_global_mouse_position()
	rotation = (mouse - global_position).angle()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var bullet = bullet_scene.instantiate()
			bullet.position = global_position
			bullet.direction = (get_global_mouse_position() - global_position).normalized()
			get_parent().add_child(bullet)

func take_damage():
	health -= 1
	get_parent().update_health(health)
	if health <= 0:
		get_parent().go_to_game_over()
