extends Control



func _on_option_button_item_selected(index: int) -> void:
	if index == 0:
		Global.Gyro = true
		Global.Keyboard = false
	if index == 1:
		Global.Gyro = false
		Global.Keyboard = true
	
	pass # Replace with function body.
	

func _on_start_button_button_down() -> void:
	if Global.Keyboard == true:
		get_tree().change_scene_to_file("res://tutorial.tscn")
	if Global.Gyro == true:
		get_tree().change_scene_to_file("res://calibrate.tscn")
	pass # Replace with function body.


func _on_quit_button_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.
