extends Area2D

var direction : Vector2
var min_positions : Vector2 = Vector2(20, 185)
var max_positions : Vector2 = Vector2(520, 740)
var speed : int = 350
var score : int
var coins_collected_in_level : int
var can_move : bool

func _process(delta: float) -> void:
	if can_move:
		position += direction * speed * delta
		position.x = clamp(position.x, min_positions.x, max_positions.x)
		position.y = clamp(position.y, min_positions.y, max_positions.y)
	else :
		if get_parent().game_over:
			$AnimatedSprite2D.animation = "Death"
			return
		
		$AnimatedSprite2D.animation = "Idle"

func _on_up_button_button_down() -> void:
	can_move = true
	direction = Vector2.UP
	$AnimatedSprite2D.animation = "Back"


func _on_up_button_button_up() -> void:
	can_move = false


func _on_down_button_button_down() -> void:
	can_move = true
	direction = Vector2.DOWN
	$AnimatedSprite2D.animation = "Front"


func _on_down_button_button_up() -> void:
	can_move = false


func _on_right_button_button_down() -> void:
	can_move = true
	direction = Vector2.RIGHT
	$AnimatedSprite2D.animation = "Walk"
	

func _on_right_button_button_up() -> void:
	can_move = false


func _on_left_button_button_down() -> void:
	can_move = true
	direction = Vector2.LEFT
	$AnimatedSprite2D.animation = "Walk"
	$AnimatedSprite2D.flip_h = true


func _on_left_button_button_up() -> void:
	can_move = false
	$AnimatedSprite2D.flip_h = false


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Coin"):
		coins_collected_in_level += 1
		score += 1
		get_parent().get_node("UI/CoinsLabel").text = "Coins: " + str(score)
		get_parent().get_node("UI/CoinsLabelAnimationPlayer").play("ScoreIncreased")
		
		if coins_collected_in_level == get_parent().level:
			coins_collected_in_level = 0
			get_parent().level_passed()
