extends Node2D

var collectables_collected_2 = 0

func _ready():
	$YSort/Door2/Area2D.connect("body_entered", self, "_on_body_entered")
	$YSort/TochaEsquerda4/Area2D.connect("body_entered", self, "_on_body_entered_2")

func on_collectable_collected_2():
	collectables_collected_2 += 1
	if collectables_collected_2 == 2:
		$YSort/Door2/Area2D.set_process_input(true)

func _on_body_entered(body):
	if body.is_in_group("player") and collectables_collected_2 == 2:
		SceneTransition.change_scene("res://Scenes/PlayableScenes/Main_3.tscn")


func _on_body_entered_2(body):
	if body.is_in_group("player") and not PlayerState.wearing_uniform:
		SceneTransition.change_scene("res://Scenes/Cutscenes/SecretRoom2Cutscene.tscn")
		
