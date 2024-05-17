extends Control


func _ready():
	$Panel/ReturnButton.connect("pressed", self, "_on_ReturnButton_pressed")
	$Panel/ExitButton.connect("pressed", self, "_on_ExitButton_pressed")


func _on_ReturnButton_pressed():
	SceneTransition.change_scene("res://Scenes/PlayableScenes/Main.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
