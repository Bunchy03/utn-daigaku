extends Area2D

@export var speed: float = 400.0

func _physics_process(delta: float) -> void:
	#Moves to the left
	position.x -= speed * delta
	
	#if gets out by the left, it erases it
	if position.x < -1600: 
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	#is this the player?
	if body.is_in_group("jugador"):
		
		#is jumping?
		if body.z_pos == 0:
			print("aay, ta catete")
			body.modulate = Color.RED
			await get_tree().create_timer(0.2).timeout
			body.modulate = Color.DODGER_BLUE
