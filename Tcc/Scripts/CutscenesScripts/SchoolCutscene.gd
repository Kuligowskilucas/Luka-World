extends "res://Scripts/CutscenesScripts/CutsceneBase.gd"

func _ready():
	._ready()
	$AnimationPlayer.play("Cutscene animation")

func _on_animation_finished(animation_name):
	if animation_name == "Cutscene animation":
		start_dialogue("LukaEscola")

func _on_dialogues_finished():
	SceneTransition.change_scene("res://Scenes/Cutscenes/LibraryCutscene.tscn")
