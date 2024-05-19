extends Node2D

onready var dialogue_control = $DialogueControl
var Dialogues = preload("res://Scripts/DialoguesScripts/Dialogues.gd").new()

func _ready():
	if has_node("AnimationPlayer"):
		var animation_player = $AnimationPlayer
		animation_player.connect("animation_finished", self, "_on_animation_finished")
	dialogue_control.connect("dialogues_finished", self, "_on_dialogues_finished")

func _on_animation_finished(animation_name):
	pass

func _on_dialogues_finished():
	pass

func start_dialogue(key):
	dialogue_control.dialogue_list = [Dialogues.dialogues[key]]
	dialogue_control.start_next_dialogue()


