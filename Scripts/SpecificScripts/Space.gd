extends RichTextLabel


var blink_interval = 0.5

func _ready():
	blink()

func blink():
	while true:
		visible = !visible
		yield(get_tree().create_timer(blink_interval), "timeout")
