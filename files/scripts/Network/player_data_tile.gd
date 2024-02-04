extends HBoxContainer



func setData(playerId, playerName):
	$TextName.text = playerName
	$TextId.text = str(playerId)
