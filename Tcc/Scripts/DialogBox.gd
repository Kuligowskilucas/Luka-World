extends NinePatchRect

export var dialogPath = ""
export (float) var textSpeed = 0.05

var dialog

var phraseNum = 0
var finished = false

func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "dialogo não encontrado")
	nextPhrase()
	
func _process(delta):
	$Space.visible = finished
	if Input.is_action_just_pressed("ui_right"):
		if finished:
			nextPhrase()
		else: 
			$Text.visible_characters = len($Text.text)
			
	if Input.is_action_just_pressed("ui_accept"):
		SceneTransition.change_scene("res://Scenes/Main.tscn")
	
func getDialog() -> Array:
	var f = File.new()
	assert(f.file_exists(dialogPath), "o arquivo não existe")
	
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	
	var output  = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
		
func nextPhrase() -> void:
	if phraseNum >= len(dialog):
		queue_free()
		return
		
	finished = false
	
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		yield($Timer, "timeout")
		
	finished = true
	phraseNum += 1
	return
