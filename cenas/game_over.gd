extends Node2D

func _on_botao_menu_pressed():
	get_tree().change_scene("res://cenas/menu.tscn") #mudança de cena após a ação da função ser realizada
