extends "res://Scripts/CutscenesScripts/CutsceneBase.gd"



func _ready():
	._ready()
	$AnimationPlayer.play("Walking")

func _on_animation_finished(animation_name):
	if animation_name == "Walking":
		start_dialogue("SecretRoomDialogue")

func _on_dialogues_finished():
	SceneTransition.change_scene_white("res://Scenes/PlayableScenes/Main.tscn")
