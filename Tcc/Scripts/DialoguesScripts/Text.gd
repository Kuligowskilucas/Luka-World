extends RichTextLabel

signal start_dialogue(character)

var dialogues = {
	"Luka": ["Maldição! Estou atrasado para a prova de história!"]
}

var current_dialogue = ""
var current_character = ""

func _ready():
	pass

func start_dialogue(character):
	current_character = character
	var dialogue = dialogues[current_character]
	for line in dialogue:
		current_dialogue = line
		_process(0)

func _process(delta):
	if current_dialogue != "":
		bbcode_text += current_dialogue[0]
		current_dialogue.erase(0, 1)
		yield(get_tree().create_timer(0.05), "timeout")
