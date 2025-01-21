extends Control


func _ready() -> void:
	Global.runsNum +=1
	Global.scoreBoard += str(Global.runsNum)
	Global.scoreBoard += str(".")
	Global.scoreBoard += str(" ")
	Global.scoreBoard += str(Global.timeScore)
	Global.scoreBoard += str("\n")
	$"Score Board".append_text(Global.scoreBoard)
	pass

func _on_home_button_down() -> void:
	$"Score Board".clear()
	Global.timeScore = 0
	Global.rX = 0
	Global.rY = 0
	Global.rZ =0
	get_tree().change_scene_to_file("res://title_screen.tscn")
	pass # Replace with function body.


func _on_quit_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_restart_button_down() -> void:
	$"Score Board".clear()
	Global.timeScore = 0
	Global.rX = 0
	Global.rY = 0
	Global.rZ =0
	get_tree().change_scene_to_file("res://tutorial.tscn")
	pass # Replace with function body.
