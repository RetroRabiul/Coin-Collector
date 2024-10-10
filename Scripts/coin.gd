extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		$AnimationPlayer.play("CoinCollected")
		$CollisionShape2D.call_deferred("set_disabled", true)


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()
