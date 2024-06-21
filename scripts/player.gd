extends CharacterBody2D

const speed = 200
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)
	move_and_slide()

func player_movement(delta):
	var movement_velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		movement_velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		movement_velocity.x -= speed
		
	if Input.is_action_pressed("ui_down"):
		current_dir = "down"
		movement_velocity.y += speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		movement_velocity.y -= speed
		
	if movement_velocity == Vector2.ZERO:
		play_anim(0)
	else:
		play_anim(1)
	
	velocity = movement_velocity  # Assign movement_velocity to the velocity property
		
func play_anim(movement):
	var dir = current_dir
	var anim = $CollisionShape2D/AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		else:
			anim.play("side_idle")
	elif dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		else:
			anim.play("side_idle")
	elif dir == "down":
		if movement == 1:
			anim.play("front_walk")
		else:
			anim.play("front_idle")
	elif dir == "up":
		if movement == 1:
			anim.play("back_walk")
		else:
			anim.play("back_idle")
