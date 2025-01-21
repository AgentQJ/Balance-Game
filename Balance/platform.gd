extends AnimatableBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Rotate around the object's local X axis by 0.1 radians.
	#rotate_object_local(Vector3(1, 0, 0), (Global.rZ *-1))
	transform = transform.orthonormalized()
	#rotate_object_local(Vector3(0, 0, 1), (Global.rX *-1))
	
	rotate_x(Global.rZ*-1)
	#(Global.rX * delta/1000)
	pass
