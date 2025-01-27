class_name DamageBulletPowerUp
extends BaseBulletPowerUp


func apply_upgrade(bullet: Bullet):
	bullet.hitbox_component.damage += 5
