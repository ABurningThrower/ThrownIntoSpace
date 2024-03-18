extends TextureRect


func _ready() -> void:
	$Credits.text = str(Settings.getPlayerResource().wallet["credits"])
	
#	for currency in Settings.getPlayerResource().wallet
#		var path = $ + "$"Wallet Popup/VBox/" + currency + "/Amount""
#		if currency != -1:
#			path.text = str(Settings.getPlayerResource().wallet[currency])
#		else:
#			path.hide()

	$"Wallet Popup/Marginizer/VBox/Credits/Amount".text = str(Settings.getPlayerResource().wallet["credits"])
	$"Wallet Popup/Marginizer/VBox/Platinum/Amount".text = str(Settings.getPlayerResource().wallet["platinum"])
	$"Wallet Popup/Marginizer/VBox/Nanites/Amount".text = str(Settings.getPlayerResource().wallet["nanites"])
	$"Wallet Popup/Marginizer/VBox/Corpsium/Amount".text = str(Settings.getPlayerResource().wallet["corpsium"])
	$"Wallet Popup/Marginizer/VBox/KFC/Amount".text = str(Settings.getPlayerResource().wallet["kfc"])
	$"Wallet Popup/Marginizer/VBox/Cryptos/Amount".text = str(Settings.getPlayerResource().wallet["cryptos"])



func _on_wallet_btn_pressed() -> void:
	toggleWallet()

func toggleWallet() -> void:
	if $"Wallet Popup".visible == false:
		$"Wallet Popup".show()
	else:
		$"Wallet Popup".hide()
