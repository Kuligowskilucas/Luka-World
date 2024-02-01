extends KinematicBody2D

signal life_changed(new_life_value)
signal uniform_changed(is_wearing_uniform)


var letter: bool = false
var wearing_uniform = false
const MOTION_SPEED = 160
export (int) var life = 3 setget set_life
var facing_direction = Vector2(1, 0)
var is_taking_damage = false

var direction_map = {
	"ui_right": Vector2(1, 0),
	"ui_left": Vector2(-1, 0),
	"ui_up": Vector2(0, -1),
	"ui_down": Vector2(0, 1)
}

func _ready():
	add_to_group("player")

func _physics_process(delta):
	var motion = Vector2()
	
	for action in direction_map.keys():
		if Input.is_action_pressed(action):
			motion += direction_map[action]

	motion = motion.normalized() * MOTION_SPEED
	move_and_slide(motion)

	if motion.length() > 0:
		facing_direction = motion.normalized()

	if !is_taking_damage:
		if motion.length() > 0:
			if PlayerState.wearing_uniform == true:
				$AnimatedSprite.play(get_animation_name(facing_direction, "walk_uniform_"))
			elif PlayerState.wearing_uniform == false:
				$AnimatedSprite.play(get_animation_name(facing_direction, "walk_"))
		else:
			$AnimatedSprite.stop()


func get_animation_name(direction, prefix=""):
	direction = direction.normalized()
	if abs(direction.x) > abs(direction.y):
		return prefix + ("right" if direction.x > 0 else "left")
	else:
		return prefix + ("down" if direction.y > 0 else "up")

func set_life(value):
	life = value
	emit_signal("life_changed", life)
	if life <= 0:
		SceneTransition.change_scene("res://Scenes/VisualScenes/GameOver.tscn")

func take_damage(amount):
	is_taking_damage = true
	set_life(life - amount)
	$AnimatedSprite.animation = "damage_" + get_animation_name(facing_direction)
	$DamageTimer.start(0.1)

func _on_DamageTimer_timeout():
	is_taking_damage = false
	$AnimatedSprite.animation = get_animation_name(facing_direction, "walk_")
