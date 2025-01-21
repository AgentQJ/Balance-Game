using Godot;
using System;
using System.IO.Ports;

public partial class SerialPortReader : Node
{
	SerialPort mySerialPort;
	bool hasHeardFromArduino = false;
	
	public string serialMessage = System.String.Empty;
	// public float calX = 0;
	// public float calY = 0;
	// public float calZ = 0;
	// public float rX = 0;
	// public float rY = 0;
	// public float rX= 0;

	// Called when the node enters the scene tree for the first time.
	//public override void _Ready()
	public void initialize()
	{
		mySerialPort = new SerialPort();
		mySerialPort.PortName = "COM3";
		mySerialPort.BaudRate = 115200;
		mySerialPort.Open();
		//mySerialPort = new SerialPort("COM3",115200);
		serialMessage = "Initialized";
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	//public override void _Process(double delta)
	public string readSerialPort()
	{
		if(!mySerialPort.IsOpen) {
			serialMessage = "No signal";
			return serialMessage;
			}
			
		//serialMessage = mySerialPort.ReadLine();
		serialMessage = mySerialPort.ReadExisting();
		//print(serialMessage);
		
		//serialMessage = mySerialPort.ReadLine();
		//serialMessage = "HERE";
		
		//if (hasHeardFromArduino == true) {
		//	mySerialPort.Write("1");
		//}
		//mySerialPort.Write("1");      
		
		return serialMessage;          
	
	}

	public void close()
	{
		mySerialPort.Close();
		return;
	}	
	
	public string readSerialPortOnce()
	{
		if(!mySerialPort.IsOpen) {
			serialMessage = "No signal";
			return serialMessage;
			}
		else{
			serialMessage ="";
		}
		
		while (serialMessage == ""){
		serialMessage = mySerialPort.ReadLine();
		}
		//serialMessage = mySerialPort.ReadExisting();
		//print(serialMessage);
		
		//serialMessage = mySerialPort.ReadLine();
		//serialMessage = "HERE";
		
		//if (hasHeardFromArduino == true) {
		//	mySerialPort.Write("1");
		//}
		//mySerialPort.Write("1");      
		
		return serialMessage;          

	}
}
