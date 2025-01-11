extends Node2D
 
var l_hp := 100
var player: CharacterBody2D 

func _ready():
	player = get_parent()
	l_hp = GameManager.get_player_hp()
	print('Health.gd l_hp: ' + str(l_hp))
	
func take_damage(damage: int):
	l_hp -= damage
	l_hp = max(l_hp, 0)
	#Update GameManager's global hp
	GameManager.set_player_hp(l_hp)
	
func is_dead() -> bool:
	return l_hp == 0
	
func _process(delta: float) -> void:
	pass
	  
