extends "res://Scripts/CutscenesScripts/CutsceneBase.gd"

func _ready():
	dialogue_control.dialogue_list = [Dialogues.dialogues["LukaLate"]]
	dialogue_control.start_next_dialogue()

	BackgroundMusic.play_music()

func _on_dialogues_finished():
	SceneTransition.change_scene("res://Scenes/PlayableScenes/Road.tscn")
