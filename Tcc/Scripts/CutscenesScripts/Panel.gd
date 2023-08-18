extends Panel

var is_paused = false

func _ready():
	get_tree().connect("paused", self, "_on_game_paused")

func _input(event):
	if event.is_action_pressed("ui_pause"):
		toggle_pause()

func toggle_pause():
	is_paused = !is_paused
	$PauseMenu.visible = is_paused
	get_tree().paused = is_paused

func _on_game_paused():
	# Aqui, você pode adicionar qualquer código adicional que precisa ser executado quando o jogo é pausado, se necessário.
	pass
