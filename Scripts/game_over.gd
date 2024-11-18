extends Control


func _on_play_again_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_home_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
