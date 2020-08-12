extends Area2D
class_name Attack

export (int) var damage
export (int) var startup_frames
export (int) var active_frames
export (int) var recovery_frames

func _on_hit():
	pass

func _animate():
	if Input.is_action_just_pressed('attack'):
		print('punch')
		$AnimationPlayer.play("Jab")

func start():
	pass


func _on_Jab_body_entered(body):
	print(body)
