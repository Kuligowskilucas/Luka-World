extends Area2D

signal arma_coletada

func _on_Arma_body_entered(body):
	if body.is_in_group("player"):
		body.arma = true
		emit_signal("arma_coletada")
		queue_free()


