extends VBoxContainer
class_name NetworkUI

const DEFAULT_IP_ENTRY = "127.0.0.1"
const DEFAULT_PORT_ENTRY = 22557


@export var ipText : TextEdit
@export var portText : TextEdit
@export var connectButton : Button
@export var hostButton : Button


func _ready() -> void:
	ipText.text_changed.connect(highlightIPError)
	portText.text_changed.connect(highlightPortError)
	connectButton.pressed.connect(onConnectClick)
	hostButton.pressed.connect(onHostClick)


func onHostClick() -> void:
	if (validatePort(portText.text)):
		var port = portText.text
		if port == "":
			port = DEFAULT_PORT_ENTRY
		NetworkManager.requestServerStart(ipText.text, port)
	
func onConnectClick() -> void:
	if (validateIPv4(ipText.text) && validatePort(portText.text)):
		var ip = ipText.text
		if ip == "":
			ip = DEFAULT_IP_ENTRY
		var port = portText.text
		if port == "":
			port = DEFAULT_PORT_ENTRY
		NetworkManager.requestClientStart(ip, port)

func validateIPv4(ip) -> RegExMatch:
	var regexIp = RegEx.new()
	regexIp.compile(r"^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$|^$")
	return regexIp.search(ip)

func validatePort(port) -> RegExMatch:
	var regexPort = RegEx.new()
	regexPort.compile(r"^\d{1,6}$|^$")
	return regexPort.search(port)

func highlightIPError() -> void:
	if !validateIPv4(ipText.text):
		ipText.modulate = Color.LIGHT_CORAL
	else:
		ipText.modulate = Color.WHITE

func highlightPortError() -> void:
	if !validatePort(portText.text):
		portText.modulate = Color.LIGHT_CORAL
	else:
		portText.modulate = Color.WHITE


func show_host():
	%"Host Btn".visible = true
	%"Connect Btn".visible = false

func show_connect():
	%"Host Btn".visible = false
	%"Connect Btn".visible = true
