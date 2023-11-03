extends Node3D

@onready var player:RigidBody3D = $"../../.."

@onready var flames:GPUParticles3D = $GPUParticles3D

@export var power = 100 

@export var trigger = 0 

func _physics_process(delta):
	if trigger > 0:
		var force = - global_transform.basis.y * power * trigger
		player.apply_force(-force, Vector3.ZERO)
		flames.emitting = true
		flames.amount = max(500 * trigger, 1)
	else:
		flames.emitting = false

func _on_xr_controller_3d_input_float_changed(name, value):
	if name == "grip":
		trigger =  value
		
	#print(name)
#	
	pass

func _on_xr_controller_3d_button_pressed(name):
	#print("PRESS LEFT:", name)
	pass # Replace with function body.

func _on_xr_controller_3d_button_released(name):
	#print("RELEASE LEFT:", name)
	pass # Replace with function body.

func _on_xr_controller_3d_2_button_pressed(name):
	#print("PRESS RIGHT:", name)
	pass # Replace with function body.

func _on_xr_controller_3d_2_button_released(name):
	#print("PRESS RIGHT:", name)
	pass # Replace with function body.

func _on_xr_controller_3d_input_vector_2_changed(name, value):
	print("LEFT:", name, " ", value)
	pass # Replace with function body.


func _on_xr_controller_3d_2_input_vector_2_changed(name, value):
	print("RIGHT:", name, " ", value)
	pass # Replace with function body.
