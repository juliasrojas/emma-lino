extends Node2D

func _on_lilo_animacao_animation_finished():
	$AnimationPlayer.play("fade in") #animação de entrada da tela
	yield(get_tree().create_timer(4), "timeout") #tempo que a animação de entrada será executada
	get_tree().change_scene("res://cenas/animacao2.tscn")
	
