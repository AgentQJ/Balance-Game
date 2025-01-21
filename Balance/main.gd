extends Node

var SerialPortReader = load("res://SerialPortReader.cs")
var mySerialPortReader = SerialPortReader.new()
var serialMessage = "NOTHING READ"
var inputData =[]
var check =[]
func round_place(num,places):
	return (round(num*pow(10,places))/pow(10,places))
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mySerialPortReader.initialize()
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$RichTextLabel.clear()
	$RichTextLabel.append_text(str(round_place((500-($Timer.time_left)),2)))
	
	#mySerialPortReader.readSerialPort()
	#serialMessage = mySerialPortReader.serialMessage
	if (Global.Gyro == true):
		serialMessage=mySerialPortReader.readSerialPort()
		inputData = serialMessage.split(",")
		#$RichTextLabel.clear()
		#if (len(inputData)>=3):
			#$RichTextLabel.append_text(inputData[1])
		#else:
			#$RichTextLabel.append_text("not working")
		# checkb len ==3
		if (len(inputData) == 3):
			var posCheck = 0
			for i in inputData:
				check =i.split()
				
				if (len(check) > 1):
					if (check[1] != '-'):
						if (check.count(".") ==1):
							posCheck +=1
			if(posCheck ==3):
				Global.rY = (float(inputData[0]) - float(Global.calibrationData[0])) *delta
				Global.rX = (float(inputData[1])- float(Global.calibrationData[1]))*delta
				Global.rZ= (float(inputData[2])- float(Global.calibrationData[2]))*delta
				#$RichTextLabel.append_text(serialMessage)
					
		#serialMessage = mySerialPortReader.readSerialPort()
		#$RichTextLabel.append_text(serialMessage)
		
	#if a.Y < -20:
		
func _input(event):
	if Global.Keyboard == true:
		if event is InputEventKey and event.pressed:
			if event.keycode == KEY_W:
				Global.rX = 0.05
			if event.keycode == KEY_A:
				Global.rZ = 0.025
			if event.keycode == KEY_S:
				Global.rX = -0.05
			if event.keycode == KEY_D:
				Global.rZ = -0.025
		
				
			
		
		
		#$platform.transform.rotate_x((rX * (delta/1000)))
		#$platform.rotate_y((rY * (delta/1000)))
		#$platform.rotate_z((rZ * (delta/1000)))
	#print(serialMessage)
	
	pass
	


func _on_area_3d_body_entered(body: Node3D) -> void:
	
	Global.timeScore = round_place((500 - $Timer.time_left),2)
	$Timer.stop()
	get_tree().change_scene_to_file("res://end_screen.tscn")
	pass # Replace with function body.
