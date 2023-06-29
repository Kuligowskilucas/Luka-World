extends NinePatchRect

var dialogue_started = false

func _process(delta):
	if !dialogue_started:
		$Text.start_dialogue("Luka")
		dialogue_started = true
