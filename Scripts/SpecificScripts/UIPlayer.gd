extends CanvasLayer

onready var heart1 = $Heart1
onready var heart2 = $Heart2
onready var heart3 = $Heart3


func _ready():
	var player = get_tree().get_nodes_in_group("player")[0]
	player.connect("life_changed", self, "_on_life_changed")
	update_hearts(player.life)



func update_hearts(life):
	heart1.visible = life >= 1
	heart2.visible = life >= 2
	heart3.visible = life >= 3


func _on_life_changed(new_life_value):
	update_hearts(new_life_value)
