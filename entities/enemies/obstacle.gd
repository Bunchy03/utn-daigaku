extends Area2D

@export var speed: float = 400.0

func _physics_process(delta: float) -> void:
	#Moves to the left
	position.x -= speed * delta
	
	#if gets out by the left, it erases it
	if position.x < -1600: 
		queue_free()
		
	#Constant checking of overlapping
	for body in get_overlapping_bodies():
		if body.is_in_group("jugador"):
			if body.z_pos == 0:
				body.get_damage()
