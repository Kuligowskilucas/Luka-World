extends CanvasLayer

var is_paused = false

func _ready():
	hide()
	$Control/Panel/Button.connect("pressed", self, "_on_ContinueButton_pressed")

func _process(delta):
	if Input.is_action_just_pressed("ui_pause"):
		toggle_pause()

	if get_tree().paused and not is_visible():
		show()

func toggle_pause():
	is_paused = !is_paused
	get_tree().paused = is_paused

	if is_paused:
		show()
	else:
		hide()

func _on_ContinueButton_pressed():
	toggle_pause()
