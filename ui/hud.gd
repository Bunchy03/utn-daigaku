extends CanvasLayer

@onready var hearts_list = $Control/HBoxContainer.get_children()

func _on_player_live_changed(lives_left):
	for i in range(hearts_list.size()):
		if i < lives_left:
			hearts_list[i].visible = true
		else:
			hearts_list[i].visible = false
