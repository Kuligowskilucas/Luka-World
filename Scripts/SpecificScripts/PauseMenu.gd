extends CanvasLayer

var is_paused = false

func _ready():
	hide()
	$Control/Panel/PauseButton.connect("pressed", self, "_on_ContinueButton_pressed")
	$Control/Panel/ExitButton.connect("pressed", self, "_on_ExitButton_pressed")

func _process(delta):
	if Input.is_action_just_pressed("ui_pause"):
		pause()

	if get_tree().paused and not is_visible():
		show()

func pause():
	is_paused = !is_paused
	get_tree().paused = is_paused

	if is_paused:
		show()
	else:
		hide()

func _on_ContinueButton_pressed():
	pause()
	
func _on_ExitButton_pressed():
	get_tree().quit()
