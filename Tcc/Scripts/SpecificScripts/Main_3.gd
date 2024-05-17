extends Node2D

var collectables_collected_3 = 0

func _ready():
	$YSort/Door/Area2D.connect("body_entered", self, "_on_body_entered")
	
	
func on_collectable_collected_3():
	collectables_collected_3 += 1
	if collectables_collected_3 == 3:
		$YSort/Door/Area2D.set_process_input(true)

func _on_body_entered(body):
	if body.is_in_group("player") and collectables_collected_3 == 3:
		SceneTransition.change_scene("res://Scenes/Cutscenes/GovernadorCutscene.tscn")
