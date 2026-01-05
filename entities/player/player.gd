extends CharacterBody2D

@export var SPEED = 400.0
@export var JUMP_VELOCITY = -500.0 # negativo significa arriba

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	#Jump logic
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#Hall logic
	var input_dir_y := Input.get_axis("ui_up", "ui_down")
	
	if input_dir_y:
		velocity.y = input_dir_y * (SPEED/2)
		
	move_and_slide()
