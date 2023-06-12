extends Node2D

#lista com dialogo
var texto = ["Lino, você está aqui!" , 
"...", 
"Você não está mais falando, tudo não passou de um sonho",
"Não sei o que faria sem você, Lino. Você é o meu porto seguro, eu te amo!" ,
"Só de imaginar ficar sem você meu mundo não é o mesmo"
 ]

var index = 0 #variável que itera os elementos na lista


func _ready(): 
	$AnimatedSprite.show()
	$AnimatedSprite.play()
	$caixaDialogo.hide() #esconde sprite ao entrar na cena
	$Texto.hide() #esconde sprite ao entrar na cena
	$Label.hide() #esconde sprite ao entrar na cena
	$emma.hide() #esconde sprite ao entrar na cena
	$Texto.text = texto[index] 
	
func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.hide() #esconde sprite ao entrar na cena
	$emma.show() #mostra sprite quando a ação da função acontece
	$caixaDialogo.show() #mostra sprite quando a ação da função acontece
	$Texto.show() #mostra sprite quando a ação da função acontece
	$Label.show() #mostra sprite quando a ação da função acontece
	
#funçãpara contar cada elemento da lista
func tamanho_elemento(array_element):
	var cont = 0
	for elem in array_element:
		cont += 1
	return(cont)
	
func _process(delta):
	if $Texto.visible_characters < $Texto.get_total_character_count(): 
		$Texto.visible_characters += 1 # adicionando caracteres visíveis
	else: # se caracteres visíveis = total de caracteres
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
				get_tree().change_scene("res://cenas/theend.tscn")#mudança de cena no ultimo ui_accept
			
		if Input.is_action_just_pressed("ui_accept"):
			$Texto.visible_characters = $Texto.get_total_character_count() #mostrando texto inteiro
