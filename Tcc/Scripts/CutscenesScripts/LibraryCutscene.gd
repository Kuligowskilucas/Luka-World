extends Node2D

onready var animation_player = $AnimationPlayer
onready var dialogue_control = get_node("DialogueControl")
var Dialogues = preload("res://Scripts/DialoguesScripts/Dialogues.gd").new()

func _ready():
	animation_player.play("Walking")
	animation_player.connect("animation_finished", self, "_on_animation_finished")
	dialogue_control.connect("dialogues_finished", self, "_on_dialogues_finished")

func _on_animation_finished(animation_name):
	if animation_name == "Walking":
		dialogue_control.dialogue_list = [Dialogues.dialogues["LukaBiblioteca"]]
		dialogue_control.start_next_dialogue()

func _on_dialogues_finished():
	SceneTransition.change_scene_white("res://Scenes/PlayableScenes/SecretRoom.tscn")
