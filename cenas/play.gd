extends Node2D

#lista que guarda o diálogo da cen
var texto = ["Onde está o lino?" , 
"Linoooooo", 
"Linoooo, onde você está?",
"Já procurei por toda parte, eu dormi com ele esta noite" ,
"E agora? O que vou fazer sem o Lino? Será que ele está lá fora?"
 ]

var index = 0 #variável que itera os elementos na lista

func tamanho_elemento(array_element):
	var cont = 0
	for elem in array_element:
		cont += 1
	return(cont)
func _ready():
	$Texto.text = texto[index] #texto do label = primeiro elemento da lista
	
func _process(delta):
	if $Texto.visible_characters < $Texto.get_total_character_count(): #se caracteres visíveis < total de caracteres
		$Texto.visible_characters += 1 #adicionando caracteres visíveis
	else: #se caracteres visíveis = total de caracteres
		if index == 4 and Input.is_action_just_pressed("ui_accept") and $Texto.visible_characters == tamanho_elemento(texto[index]):
				index += 1
				
		elif index + 1 < texto.size() and Input.is_action_just_pressed("ui_accept"):
				$Texto.text = texto[index + 1]
				$Texto.visible_characters = 0
				index += 1 #adicionando (se possível) mais texto ao label ao apertar "Enter" e aumentando o index para iterar
						   # o próximo elemento da lista
						
		elif index < texto.size() and Input.is_action_just_pressed("ui_accept") and $Texto.text != texto[index]:
				$Texto.text = texto[index]
				$Texto.visible_characters = 0
				index += 1
				
		if index == 5:
				get_tree().change_scene("res://cenas/game.tscn") #mudança de cena quando index == 5
			
		if Input.is_action_just_pressed("ui_accept"):
			$Texto.visible_characters = $Texto.get_total_character_count() #mostrando texto inteiro
			
