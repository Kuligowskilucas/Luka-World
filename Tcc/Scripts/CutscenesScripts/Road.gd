extends Node2D

onready var dialogue_control = get_node("DialogueControl")
var Dialogues = preload("res://Scripts/DialoguesScripts/Dialogues.gd").new()

func _ready():
	$Area2D.connect("body_entered", self, "_on_body_entered")
	$AnimationPlayer.play("Seta_animation")
	dialogue_control.dialogue_list = [Dialogues.dialogues["Tutorial"]]
	dialogue_control.start_next_dialogue()
	
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		SceneTransition.change_scene("res://Scenes/Cutscenes/SchoolCutscene.tscn")
