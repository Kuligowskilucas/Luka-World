extends Node2D

const logo_time = 5.0

func _ready():
	yield(get_tree().create_timer(logo_time), "timeout")
	change_scene()
	
func change_scene():
	SceneTransition.change_scene("res://Scenes/VisualScenes/MenuPrincipal.tscn")

