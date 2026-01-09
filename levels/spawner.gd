extends Node2D

@export var obstacle_scene: PackedScene

func _on_timer_timeout() -> void:
	#Creates a copy of an obstacle
	var new_obstacle = obstacle_scene.instantiate()
	
	#Added as spawner's child
	add_child(new_obstacle)
	
	#Y random position
	new_obstacle.position.y = randf_range(-100, 100)
	
