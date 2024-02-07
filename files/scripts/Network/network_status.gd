extends Control


@export var externalIPValue : RichTextLabel
@export var playerTile = preload("res://files/scenes/Network/player_data_tile.tscn")
var tilesById = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	NetworkManager.upnp_completed.connect(_onUPNPCompletion)
	NetworkManager.player_connected.connect(_onPlayerConnected)
	NetworkManager.player_disconnected.connect(_onPlayerDisconnected)
	NetworkManager.network_status_changed.connect(_onStatusChanged)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _onUPNPCompletion(upnpStatus):
	if upnpStatus == OK:
		externalIPValue.text = NetworkManager.externalIP


func _onPlayerConnected(id, data):
	var newPlayerTile = playerTile.instantiate()
	tilesById[id] = newPlayerTile
	$PanelNetStatus/VBoxContainer.add_child(newPlayerTile)
	
	newPlayerTile.setData(id, data.name)
	

func _onPlayerDisconnected(id):
	tilesById[id].queue_free()
	tilesById.erase(id)

func _onStatusChanged(status):
	var statusName = NetworkManager.NETWORK_STATUS.keys()[status]
	$PanelNetStatus/VBoxContainer/HBoxContainer/ValueStatus.text = statusName
