extends "res://Scripts/CutscenesScripts/CutsceneBase.gd"

func _ready():
	._ready()
	$AnimationPlayer.play("Walking")

func _exit_tree():
	BackgroundMusic.stop_music()

func _on_animation_finished(animation_name):
	if animation_name == "Walking":
		start_dialogue("LukaBiblioteca")

func _on_dialogues_finished():
	SceneTransition.change_scene_white("res://Scenes/Cutscenes/SecretRoomCutscene.tscn")
