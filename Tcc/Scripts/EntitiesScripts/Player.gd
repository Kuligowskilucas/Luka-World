extends KinematicBody2D

const MOTION_SPEED = 160
var moved = false

func _ready():
	pass

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
		moved = true
		
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
		moved = true
		
	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
		moved = true
		
	if Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
		moved = true
	
	if motion != Vector2():
		$AnimatedSprite.play(get_direction(motion))
	else:
		$AnimatedSprite.stop()
	
	motion = motion.normalized() * MOTION_SPEED
	move_and_slide(motion)

func get_direction(motion):
	var direction = motion.normalized()
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			return "walk_right"
		else:
			return "walk_left"
	else:
		if direction.y > 0:
			return "walk_down"
		else:
			return "walk_up"
	
