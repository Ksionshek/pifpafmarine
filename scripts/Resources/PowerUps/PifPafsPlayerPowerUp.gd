class_name PifPafsPlayerPowerUp
extends BasePlayerPowerUp

enum _tier {SINGEL = 1, DOUBLE = 2, TRIPLE = 3}

@export var tier: _tier

func apply_upgrade(player: Player):
	var pifpafs = player.pifpafs.get_children()
	match tier:
		_tier.SINGEL:
			pifpafs[0].visible = true
			pifpafs[1].visible = false
			pifpafs[2].visible = false
		_tier.DOUBLE:
			pifpafs[0].visible = false
			pifpafs[1].visible = true
			pifpafs[2].visible = true
		_tier.TRIPLE:
			pifpafs[0].visible = true
			pifpafs[1].visible = true
			pifpafs[2].visible = true
		_:
			print('PifPafsPlayerPowerUp.gd default')
