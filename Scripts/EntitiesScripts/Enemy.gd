extends KinematicBody2D

onready var animation: AnimationPlayer = $Animation
onready var sprite: Sprite = $Sprite

var player_ref: Node = null
var velocity: Vector2 = Vector2.ZERO 

export (int) var speed = 100
export (int) var damage = 1
export (float) var damage_cooldown_time = 1.0
var last_damage_time = -damage_cooldown_time

func _physics_process(delta: float) -> void:
	if PlayerState.wearing_uniform:
		velocity = Vector2.ZERO
		move_and_slide(velocity)
		animation.stop()
	else:
		handle_movement()
		handle_animation()

func handle_movement() -> void:
	if player_ref:
		var direction = (player_ref.global_position - global_position).normalized()
		
		if player_ref.global_position.distance_to(global_position) > 50:
			velocity = direction * speed
		else:
			velocity = Vector2.ZERO
			
	else: velocity = Vector2.ZERO
		
	move_and_slide(velocity)

	for i in range(get_slide_count()):
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("player"):
			if OS.get_ticks_msec() - last_damage_time >= damage_cooldown_time * 1000:
				collision.collider.take_damage(damage)
				last_damage_time = OS.get_ticks_msec()


func get_max_index(arr: Array) -> int:
	var max_val = arr[0]
	var max_index = 0
	for i in range(arr.size()):
		if arr[i] > max_val:
			max_val = arr[i]
			max_index = i
	return max_index

func handle_animation() -> void:
	if velocity == Vector2.ZERO:
		animation.stop()
		return

	var directions = ["walk_up", "walk_down", "walk_left", "walk_right"]
	var dot_products = [velocity.normalized().dot(Vector2(0, -1)),
						velocity.normalized().dot(Vector2(0, 1)),
						velocity.normalized().dot(Vector2(-1, 0)),
						velocity.normalized().dot(Vector2(1, 0))]

	var max_index = get_max_index(dot_products)
	animation.play(directions[max_index])

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player_ref = body

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		player_ref = null
