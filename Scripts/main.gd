extends Node

@export var coin : PackedScene
@export var confetti : PackedScene

var min_positions : Vector2 = Vector2(20, 185)
var max_positions : Vector2 = Vector2(520, 740)
var level : int = 1

func _ready() -> void:
	instantiate_coin()

func instantiate_coin() -> void:
	for i in range(level):
		var coin_instance : Area2D = coin.instantiate()
		var random_x : float = randf_range(min_positions.x, max_positions.x)
		var random_y : float = randf_range(min_positions.y, max_positions.y)
		coin_instance.position = Vector2(random_x, random_y)
		call_deferred("add_child", coin_instance)
		

func level_passed() -> void:
	level += 1
	$UI/LevelLabel.text = "level: " + str(level)
	instantiate_coin()
	instantiate_confetti()

func instantiate_confetti() -> void:
	var confetti_instance : CPUParticles2D = confetti.instantiate()
	add_child(confetti_instance)
	confetti_instance.emitting = true
