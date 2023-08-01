extends Node2D


func _ready():
	$Area2D.connect("body_entered", self, "_on_body_entered")
	$AnimationPlayer.play("Seta_animation")
	
	
	
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		SceneTransition.change_scene("res://Scenes/Cutscenes/Cutscene3.tscn")
