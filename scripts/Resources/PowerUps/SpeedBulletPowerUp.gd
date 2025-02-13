class_name SpeedBulletPowerUp
extends BaseBulletPowerUp

@export var amount: int = 100

func apply_upgrade(bullet: Bullet):
	print('DBP.gd: bullet dmg before: ' + str(bullet.speed))
	bullet.speed += amount
	print('DBP.gd: bullet dmg after: ' + str(bullet.speed))
	
  
