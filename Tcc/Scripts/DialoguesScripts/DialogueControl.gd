extends Control

signal dialogues_finished

onready var name_label = $NinePatchRect/Name
onready var dialogue_label = $NinePatchRect/Text
onready var character_image = $NinePatchRect/CharacterImage


var current_dialogue = []
var current_line_index = 0
var dialogue_list = []
var is_typing = false
var skip_typing = false  

func _ready():
	hide()
	name_label.align = Label.ALIGN_CENTER

func start_dialogue(dialogue, formato = "normal"):
	if formato == "normal":
		$NinePatchRect.rect_size = Vector2(788, 166)
	elif formato == "coletavel":
		$NinePatchRect.rect_size = Vector2(400, 400)
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
		var character_texture = load("res://Tiles_arts/Portraits/" + line_data["name"] + ".png")
		character_image.texture = character_texture
		name_label.text = line_data["name"]
		var line = line_data["text"]
		dialogue_label.bbcode_text = ""
		is_typing = true
		for i in range(line.length()):
			if skip_typing:
				dialogue_label.bbcode_text = line
				break
			dialogue_label.bbcode_text += line[i]
			#if line[i] != " ":
				#$AudioStreamPlayer.stop()
				#$AudioStreamPlayer.play()
				
			var timeout = 0.15
			if line[i] == ",":
				timeout = 0.15
			elif line[i] == ".":
				timeout = 0.3
			elif line[i] == "!":
				timeout = 0.2
			else:
				timeout = 0.05
			yield(get_tree().create_timer(timeout), "timeout")
			
		is_typing = false
		skip_typing = false  
		current_line_index += 1
	else:
		start_next_dialogue()

func _input(event):
	if event.is_action_pressed("ui_select") and is_visible():
		if is_typing:
			
			skip_typing = true
		else:
			type_dialogue()
			

