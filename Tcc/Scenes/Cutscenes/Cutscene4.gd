extends Node2D

onready var dialogue_control = get_node("DialogueControl")
var Dialogues = preload("res://Scripts/DialoguesScripts/Dialogues.gd").new()

func _ready():
	dialogue_control.connect("dialogues_finished", self, "_on_dialogues_finished")
	dialogue_control.dialogue_list = [Dialogues.dialogues["LukaBiblioteca"]]
	dialogue_control.start_next_dialogue()

func _on_dialogues_finished():
	SceneTransition.change_scene_white("res://Scenes/PlayableScenes/Main.tscn")
