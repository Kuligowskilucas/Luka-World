extends KinematicBody2D

const MOTION_SPEED = 160
var arma = false
var arma_sprite_resource = preload("res://TileMap/objects/musket.png")
var arma_sprite = Sprite.new()
var facing_direction = Vector2(1, 0)

func _ready():
	arma_sprite.texture = arma_sprite_resource
	$WeaponHolder.add_child(arma_sprite)
	arma_sprite.hide()

func _physics_process(delta):
	var motion = Vector2()

	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1

	update_weapon_sprite(motion)

	motion = motion.normalized() * MOTION_SPEED
	move_and_slide(motion)
	
	if motion != Vector2():
		$AnimatedSprite.play(get_direction(motion))
	else:
		$AnimatedSprite.stop()

func update_weapon_sprite(motion):
	if not arma:
		arma_sprite.hide()
		return

	if motion.y < 0:
		arma_sprite.hide()
	else:
		arma_sprite.show()

		if motion.x < 0:
			arma_sprite.scale.x = -abs(arma_sprite.scale.x)
		elif motion.x > 0:
			arma_sprite.scale.x = abs(arma_sprite.scale.x)

func get_direction(motion):
	var direction = motion.normalized()
	if motion != Vector2():
		facing_direction = direction
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

func _on_Arma_collected():
	arma = true
	arma_sprite.show()
