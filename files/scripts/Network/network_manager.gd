extends Node

enum NETWORK_STATUS {
	UNINITIALIZED,
	INITIALIZED,
	CLIENT,
	SERVER
}

var status : NETWORK_STATUS = NETWORK_STATUS.UNINITIALIZED
var enet : ENetMultiplayerPeer
var players = {}
var personalDetails = {}

signal player_connected(peer_id, player_info)
signal player_disconnected(peer_id)
signal server_disconnected
signal network_status_changed(status)



func _ready():
	multiplayer.peer_connected.connect(_on_player_connected)
	multiplayer.peer_disconnected.connect(_on_player_disconnected)
	multiplayer.connected_to_server.connect(_on_connected_ok)
	multiplayer.connection_failed.connect(_on_connected_fail)
	multiplayer.server_disconnected.connect(_on_server_disconnected)

#region ENet Setup

func requestServerStart(ip, port):
	if (_initEnet()):
		if ip != "":
			enet.set_bind_ip(ip)
		enet.create_server(int(port))
		multiplayer.multiplayer_peer = enet
		status = NETWORK_STATUS.SERVER
		if USE_UPNP:
			_initUPNP(port)
		personalDetails["name"] = "DM"
		network_status_changed.emit(status)

func requestClientStart(ip, port):
	if (_initEnet()):
		enet.create_client(ip, int(port))
		multiplayer.multiplayer_peer = enet
		status = NETWORK_STATUS.CLIENT
		network_status_changed.emit(status)

func _initEnet() -> bool:
	if status == NETWORK_STATUS.UNINITIALIZED:
		enet = ENetMultiplayerPeer.new()
		status = NETWORK_STATUS.INITIALIZED
		network_status_changed.emit(status)
		return true
	else:
		return false

func _uninitEnet() -> bool:
	if status == NETWORK_STATUS.UNINITIALIZED:
		return false
	enet = null
	multiplayer.multiplayer_peer = null
	status = NETWORK_STATUS.UNINITIALIZED
	network_status_changed.emit(status)
	players.clear()
	return true

#endregion

#region UPNP

var USE_UPNP = false
var upnp_thread : Thread = null
var externalIP = ""
signal upnp_completed(error)

func _initUPNP(port):
	upnp_thread = Thread.new()
	upnp_thread.start(_coroutine_setupUPNP.bind(port))

func _coroutine_setupUPNP(port):
	var upnp = UPNP.new()
	var discoverError = upnp.discover(2000,2, "")
	
	var result = upnp.query_external_address()
	set_deferred("externalIP", result)
	
	if discoverError != OK:
		push_error(str(discoverError))
		call_deferred("emit_signal", "upnp_completed", discoverError)
		return
	
	if upnp.get_gateway() and upnp.get_gateway().is_valid_gateway():
		upnp.add_port_mapping(port, port, ProjectSettings.get_setting("application/config/name"), "UDP")
		upnp.add_port_mapping(port, port, ProjectSettings.get_setting("application/config/name"), "TCP")
		call_deferred("emit_signal", "upnp_completed", OK)
	else:
		push_error("UPNP Gateway not initialized")
		call_deferred("emit_signal", "upnp_completed", FAILED)

func _exit_tree():
	if (upnp_thread):
		upnp_thread.wait_to_finish()
#endregion

func setPersonalDetails(name):
	personalDetails["name"] = name

func _on_player_connected(id):
	_share_personal_details.rpc_id(id, personalDetails)


@rpc("any_peer", "reliable")
func _share_personal_details(playerDetails):
	var newPlayer = multiplayer.get_remote_sender_id()
	players[newPlayer] = playerDetails
	player_connected.emit(newPlayer, playerDetails)


func _on_player_disconnected(id):
	players.erase(id)
	player_disconnected.emit(id)


func _on_connected_ok():
	var id = multiplayer.get_unique_id()
	players[id] = personalDetails
	player_connected.emit(id, personalDetails)


func _on_connected_fail():
	_uninitEnet()


func _on_server_disconnected():
	_uninitEnet()
	server_disconnected.emit()
