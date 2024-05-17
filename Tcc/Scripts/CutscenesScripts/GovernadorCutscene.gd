extends "res://Scripts/CutscenesScripts/CutsceneBase.gd"

func _ready():
	._ready()
	if PlayerState.wearing_uniform:
		$AnimationPlayer.play("Talk_Uniform")
	else: 
		$AnimationPlayer.play("Talk")

func _on_animation_finished(animation_name):
	if animation_name == "Talk" && PlayerState.wearing_uniform == false:
		start_dialogue("Dialogue_Governador_uniform")
	elif animation_name == "Talk_Uniform" && PlayerState.wearing_uniform:
		start_dialogue("Dialogue_Governador")

func _on_dialogues_finished():
	SceneTransition.change_scene_white("res://Scenes/VisualScenes/FinalScene.tscn")

