extends "res://Scripts/CutscenesScripts/CutsceneBase.gd"

func _ready():
	._ready()
	$AnimationPlayer.play("New_uniform")


func _on_animation_finished(animation_name):
	if animation_name == "New_uniform":
		PlayerState.set_uniform(true)
		start_dialogue("NewUniformDialogue")

func _on_dialogues_finished():
	SceneTransition.change_scene_white("res://Scenes/PlayableScenes/Main_2.tscn")


