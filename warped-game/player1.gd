extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var portal : String


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left_player1", "right_player1")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var y_direction := Input.get_axis("up_player1", "down_player1")
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x:
		$AnimatedSprite2D.flip_h	= true
	if velocity:
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 1
		
		
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.portal_name:
		portal = area.portal_name
	
		
