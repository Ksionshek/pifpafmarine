class_name DamageBulletPowerUp
extends BaseBulletPowerUp


func apply_upgrade(bullet: Bullet):
	print('DBP.gd: bullet got dmg')
	bullet.hitbox_component.damage += 5
