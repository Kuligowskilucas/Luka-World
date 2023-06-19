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
		$AnimatedSprite.play("walk_up")
		
	elif Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
		moved = true
		$AnimatedSprite.play("walk_down")
		
	elif Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
		moved = true
		$AnimatedSprite.play("walk_left")
		
	elif Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
		moved = true
		$AnimatedSprite.play("walk_right")
		
	else: 
		$AnimatedSprite.stop()
	
	motion = motion.normalized() * MOTION_SPEED
	move_and_slide(motion)
