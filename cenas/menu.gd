extends Node2D

#função de clicar no botão
func _on_botao_play_pressed():
	get_tree().change_scene("res://cenas/play.tscn") #muda para a cena play ao clicar no botão

#função de clicar no botão
func _on_botao_history_pressed():
	get_tree().change_scene("res://cenas/history.tscn") #muda para a cena history ao clicar no botão
