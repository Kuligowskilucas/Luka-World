extends Control



func _ready():
	$Panel/ExitButton.connect("pressed", self, "_on_ExitButton_pressed")
	
func _on_ExitButton_pressed():
	get_tree().quit()

func _on_Button_pressed():
	SceneTransition.change_scene("res://Scenes/Cutscenes/RoomCutscene.tscn")

