extends Area2D

onready var dialogue_control = get_node("/root/Main_2/CanvasLayer/DialogueControl")

var Dialogues = preload("res://Scripts/DialoguesScripts/Dialogues.gd").new()

func _ready():
	if dialogue_control:
		dialogue_control.connect("dialogue_finished", self, "_on_dialogue_finished")
	else:
		print("Controlador de Diálogo não encontrado!")

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.letter = true
		if dialogue_control:
			print("Controlador de diálogo encontrado.")
			dialogue_control.start_dialogue(Dialogues.dialogues["CartaParaguai"])
		else:
			print("Controlador de Diálogo não encontrado!")
		_on_dialogue_finished()

func _on_dialogue_finished():
	queue_free()
	get_node("/root/Main_2").on_collectable_collected_2()
