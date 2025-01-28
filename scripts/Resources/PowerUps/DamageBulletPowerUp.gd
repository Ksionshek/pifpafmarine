class_name DamageBulletPowerUp
extends BaseBulletPowerUp

@export var amount: int = 5
func apply_upgrade(bullet: Bullet):
	print('DBP.gd: bullet dmg before: ' + str(bullet.hitbox_component.damage))
	bullet.hitbox_component.damage += amount
	print('DBP.gd: bullet dmg after: ' + str(bullet.hitbox_component.damage))
