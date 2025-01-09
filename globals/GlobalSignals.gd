extends Node

var max_health := 100
var current_health  : set = _set_health

func _set_health(max_health):
	current_health = max_health
	
