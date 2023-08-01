extends Node2D

onready var dialogue_control = get_node("DialogueControl")
var Dialogues = preload("res://Scripts/DialoguesScripts/Dialogues.gd").new()

func _ready():
	dialogue_control.connect("dialogues_finished", self, "_on_dialogues_finished")
	dialogue_control.dialogue_list = [Dialogues.dialogues["LukaLate"]]
	dialogue_control.start_next_dialogue()

func _on_dialogues_finished():
	SceneTransition.change_scene("res://Scenes/Cutscenes/Cutscene2.tscn")
