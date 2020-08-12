extends KinematicBody2D

var motion = Vector2.ZERO

const UP = Vector2(0,-1)

export var fall_speed = 200 
export var jump_speed = 3000
export var ground_speed = 1000
export var air_speed = 200
export var jumps = 2


func _physics_process(delta):
	apply_gravity()
	move(is_on_floor())
	jump()
	move_and_slide(motion, UP)
	

func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += fall_speed

func move(can_move):
	if Input.is_action_pressed('left'):
		if can_move:
			motion.x = -ground_speed
		elif motion.x > -ground_speed:
			motion.x -= air_speed
	elif Input.is_action_pressed('right'):
		if can_move:
			motion.x = ground_speed
		elif motion.x < ground_speed:
			motion.x += air_speed
	elif can_move:
		motion.x = 0

func jump():
	if is_on_floor():
		var jump_count = jumps
	if Input.is_action_just_pressed('jump'):
		if jump_count > 0:
			motion.y = -jump_speed
			move(true)
			jump_count -= 1
			
