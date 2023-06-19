extends KinematicBody2D


onready var animation: AnimationPlayer = get_node("Animation")
onready var sprite: Sprite = get_node("Sprite")

var player_ref = null
var velocity: Vector2
export (int) var speed
#export (int) var health


func _physics_process(_delta: float) -> void:
	move()
	animate()
	
func move() -> void:
	if player_ref != null:
		var distance: Vector2 = player_ref.global_position - global_position
		var direction: Vector2 = distance.normalized()
		var distance_length: float = distance.length()
		if distance_length <= 60:
			velocity = Vector2.ZERO
		else:
			velocity = speed * direction
			
	else:
		velocity = Vector2.ZERO
		
	velocity = move_and_slide(velocity)
		
		
	
func animate() -> void:
	if velocity.length() > 0:
		var animation_name = ""
		var direction = velocity.normalized()
		if direction.dot(Vector2(0, -1)) > 0.5:
			animation_name = "walk_up"
		elif direction.dot(Vector2(0, 1)) > 0.5:
			animation_name = "walk_down"
		elif direction.dot(Vector2(-1, 0)) > 0.5:
			animation_name = "walk_left"
		elif direction.dot(Vector2(1, 0)) > 0.5:
			animation_name = "walk_right"
		animation.play(animation_name)
	else:
		animation.stop()
	
	
	

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_ref = body


func _on_body_exited(body):
	if body.is_in_group("player"): 
		player_ref = null
