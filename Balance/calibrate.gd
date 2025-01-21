extends Control
var SerialPortReader = load("res://SerialPortReader.cs")
var mySerialPortReader = SerialPortReader.new()
var serialMessage = "NOTHING READ"
var check =[]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mySerialPortReader.initialize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_calibrate_button_down() -> void:
	var goodReading = false
	while (!goodReading):
		serialMessage=mySerialPortReader.readSerialPortOnce()
		Global.calibrationData = serialMessage.split(",")
		# checkb len ==3
		if (len(Global.calibrationData) == 3):
			var posCheck = 0
			for i in Global.calibrationData:
				check =i.split()
				
				if (check[1] != '-'):
					if (check.count(".") ==1):
						posCheck +=1
			if(posCheck ==3):
				goodReading = true
				$RichTextLabel.append_text(serialMessage)
				mySerialPortReader.close()
				get_tree().change_scene_to_file("res://tutorial.tscn")
		# check [1] of each item != "-"
		# check presence of "." in each item
		
	#len(Global.calibrationData) != 3)
	#serialMessage=mySerialPortReader.readSerialPortOnce()
	#$RichTextLabel.append_text(serialMessage)
	#Global.calibrationData = serialMessage.split(",")
	
	pass # Replace with function body.
