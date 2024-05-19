extends CharacterBody2D

const speed = 200
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)
	move_and_slide()

func player_movement(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x -= speed
	if Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y += speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y -= speed
	else:
		play_anim(0)
		velocity.y = 0
		
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk2")
		elif movement == 0:
			anim.play("side_idle2")
	
	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")