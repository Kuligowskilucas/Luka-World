extends Node2D

var collectables_collected = 0

func _ready():
	$YSort/Door/Area2D.connect("body_entered", self, "_on_body_entered")

func on_collectable_collected():
	collectables_collected += 1
	if collectables_collected == 3:
		$YSort/Door/Area2D.set_process_input(true)

func _on_body_entered(body):
	if body.is_in_group("player") and collectables_collected == 3:  
		SceneTransition.change_scene("res://Scenes/PlayableScenes/Main_2.tscn")
	


