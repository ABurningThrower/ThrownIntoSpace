extends Control
class_name NetworkUI

const DEFAULT_IP_ENTRY = "127.0.0.1"
const DEFAULT_PORT_ENTRY = 7788


@export var ipText : TextEdit
@export var portText : TextEdit
@export var connectButton : Button
@export var hostButton : Button

# Called when the node enters the scene tree for the first time.
func _ready():
	ipText.text_changed.connect(highlightIPError)
	portText.text_changed.connect(highlightPortError)
	connectButton.pressed.connect(onConnectClick)
	hostButton.pressed.connect(onHostClick)


func onHostClick():
	if (validatePort(portText.text)):
		var port = portText.text
		if port == "":
			port = DEFAULT_PORT_ENTRY
		NetworkManager.requestServerStart(ipText.text, port)
	
func onConnectClick():
	if (validateIPv4(ipText.text) && validatePort(portText.text)):
		var ip = ipText.text
		if ip == "":
			ip = DEFAULT_IP_ENTRY
		var port = portText.text
		if port == "":
			port = DEFAULT_PORT_ENTRY
		NetworkManager.setPersonalDetails($VBoxContainer/PanelNetEntry/Margin/VBoxNetworkEntry/HBoxContainer/TextTestData.text)
		NetworkManager.requestClientStart(ip, port)

func validateIPv4(ip):
	var regexIp = RegEx.new()
	regexIp.compile(r"^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$|^$")
	return regexIp.search(ip)

func validatePort(port):
	var regexPort = RegEx.new()
	regexPort.compile(r"^\d{1,6}$|^$")
	return regexPort.search(port)

func highlightIPError():
	if !validateIPv4(ipText.text):
		ipText.modulate = Color.LIGHT_CORAL
	else:
		ipText.modulate = Color.WHITE

func highlightPortError():
	if !validatePort(portText.text):
		portText.modulate = Color.LIGHT_CORAL
	else:
		portText.modulate = Color.WHITE
