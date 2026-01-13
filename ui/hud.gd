extends CanvasLayer

@onready var hearts_list = $Control/HBoxContainer.get_children()

func _on_player_live_changed(lives_left):
	for i in range(hearts_list.size()):
		if i < lives_left:
			hearts_list[i].visible = true
		else:
			hearts_list[i].visible = false

func show_game_over():
	$GameOver.visible = true
	
func _process(delta: float) -> void:
	if $GameOver.visible and Input.is_action_just_pressed("ui_accept"):
		get_tree().paused = false
		get_tree().reload_current_scene() #level reboot
	
