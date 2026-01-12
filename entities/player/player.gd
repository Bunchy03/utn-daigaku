extends CharacterBody2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0 # negativo significa arriba

var lifes: int = 3
var is_invulnerable: bool = false
var gravity_jump = 1200.0 #gravedad interna para el salto fingido
var z_velocity = 0.0 #velocidad vertical del salto
var z_pos = 0.0 #altura actual con respecto al suelo

@onready var sprite = $Sprite2D # referencia de la imagen

func _physics_process(delta: float) -> void:
	
	#Hall logic
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity.y = input_dir.y * SPEED
	velocity.x = 0
	
	#Fake jump logic
	if Input.is_action_just_pressed("jump") and z_pos == 0:
		z_velocity = JUMP_VELOCITY
		
	if z_pos < 0 or z_velocity < 0:
		z_velocity += gravity_jump * delta
		z_pos += z_velocity * delta
	
	if z_pos > 0:
		z_pos = 0
		z_velocity = 0
		
	#Apply to sprite
	sprite.position.y = z_pos
		
	move_and_slide()

func get_damage():
	#if the player is invulnerable, the damage is ignore
	if is_invulnerable:
		return
	
	#if not, less life but invulnerability activated
	lifes -= 1
	is_invulnerable = true
	$InvulnerabilityTimer.start()
	
	#Visual feedback
	modulate = Color.RED
	await get_tree().create_timer(0.2).timeout
	modulate = Color.WHITE
	modulate.a = 0.5
	
	print("Vidas restantes: ", lifes)
	
	if lifes <= 0:
		print("Recursaste (game over)")
		#Then here I can reset de level

#timeout signal conected to player
func _on_invulnerability_timer_timeout() -> void:
	is_invulnerable = false
	modulate.a = 1.0
