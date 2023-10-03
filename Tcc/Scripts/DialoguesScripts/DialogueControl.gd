extends Control

signal dialogues_finished

onready var name_label = $NinePatchRect/Name
onready var dialogue_label = $NinePatchRect/Text

var current_dialogue = []
var current_line_index = 0
var dialogue_list = []
var is_typing = false
var skip_typing = false  # Nova variável

func _ready():
	hide()

func start_dialogue(dialogue):
	current_dialogue = dialogue
	current_line_index = 0
	show()
	type_dialogue()

func start_next_dialogue():
	if dialogue_list.size() > 0:
		var next_dialogue = dialogue_list.pop_front()
		start_dialogue(next_dialogue)
	else:
		hide()
		emit_signal("dialogues_finished")

func type_dialogue():
	if current_line_index < current_dialogue.size():
		var line_data = current_dialogue[current_line_index]
		name_label.bbcode_text = line_data["name"]
		var line = line_data["text"]
		dialogue_label.bbcode_text = ""
		is_typing = true
		for i in range(line.length()):
			if skip_typing:
				dialogue_label.bbcode_text = line
				break
			dialogue_label.bbcode_text += line[i]
			yield(get_tree().create_timer(0.05), "timeout")
		is_typing = false
		skip_typing = false  # Reset it for the next dialogue
		current_line_index += 1
	else:
		start_next_dialogue()

func _input(event):
	if event.is_action_pressed("ui_select") and is_visible():
		if is_typing:
			# Completa a linha atual de diálogo
			skip_typing = true
		else:
			# Procede para a próxima linha de diálogo
			type_dialogue()
