extends Node

var player_hp = 100  # Początkowa wartość HP (można ją ustawić inaczej w grze)
var isPlayerAlive := true

# Funkcja, która ustawia HP gracza
func set_player_hp(new_hp: int) -> void:
	if new_hp < 1:
		player_dead()
	player_hp = new_hp

# Funkcja, która zwraca aktualne HP gracza
func get_player_hp() -> int:
	return player_hp
	
func player_dead():
	isPlayerAlive = false
	
# Funkcja, która inicjalizuje dane gry przy starcie (np. ładowanie HP)
func initialize_game() -> void:
	# Sprawdź, czy zapisane dane o HP gracza są dostępne
	# Możesz użyć np. `File` do zapisania HP w pliku, ale na razie przypiszemy domyślną wartość
	print('GM init_game()')
	print('GM hp: ' + str(player_hp))
	
	
func _ready() -> void:
	print('GM ready')
	initialize_game()
