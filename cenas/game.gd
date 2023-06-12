extends Node2D

#variável para ser usado como parâmetro quando o personagem estiver dentro de uma área 2d
var dentro = false

#lista com o dialogo da cena
var texto = ["Olá!" , 
"Olá! Você por acaso viu um coelho roxo por ai?", 
"Ele atende por Lino", 
"É meu coelhinho, não vivo sem ele" , 
"Olá minha cara! Meu nome é Luke" , 
"Coelho roxo...?", 
"A claro! A criatura mágica!", 
"Criatura mágica?",
"A sim, não posso dar mais detalhes sobre isso!", 
"Você terá que encontra-lo, para isso terá que se aventurar na floresta assombrada", 
"A mas não se preocupe minha jovem, ela não é tão assombrada assim, Estarei aqui caso precise, e lembre-se, você achará o Lino!", 
"", 
"Lino! Finalmente te achei", 
"Emma! Você me achou, me perdi nessa florenta!", 
"LINO! VOCÊ ESTÁ...FALANDO?", 
"Emma, só você pode me escutar", 
"Fico feliz por ter me achado, essa floresta deve ter te sido assustadora",
"Agora podemos ir para casa", 
"Me dê um abraço!", 
""
 ]

var index = 0 #variável que itera os elementos na lista

#função que analisa o tamanho da lista
func tamanho_elemento(array_element):
	var cont = 0
	for elem in array_element:
		cont += 1
	return(cont)
	
func _ready():
	$dialogoEmma/caixaDialogo/textodialogo.text = texto[index]
	#esconder sprites que serão mostrados posteriormente
	$raposa/sprite1.hide()
	$raposa/sprite2.hide()
	$raposa/ENTER.hide()
	$dialogoEmma.hide()
	$dialogoEmma/rostoEmma.hide()
	$dialogoEmma/rostoLuke.hide()
	$dialogoEmma/rostoLino.hide()
	$dialogoEmma/caixaDialogo/lino.hide()
			

func _on_Area2D_body_entered(body):
	$raposa/sprite1.show()
	$raposa/sprite2.show()
	$raposa/ENTER.show()
	dentro = true
	
func _on_Area2D_body_exited(body):
	$raposa/sprite1.hide()
	$raposa/sprite2.hide()
	$raposa/ENTER.hide()
	dentro = false
	
func _on_areaLilo_body_entered(body):
	$lilo/sprite1.show()
	$lilo/sprite2.show()
	$lilo/ENTER.show()
	dentro = true
			
	
func _on_areaLilo_body_exited(body):
	$lilo/sprite1.hide()
	$lilo/sprite2.hide()
	$lilo/ENTER.hide()
	dentro = false
	
func dialogo():
	if dentro == true and Input.is_action_just_pressed("ui_accept"):
		$dialogoEmma.show()
		return(true)
	else:
		return(false)

func _process(delta):
	if dialogo() == true:
		$dialogoEmma/caixaDialogo/textodialogo.show()
	if $dialogoEmma/caixaDialogo/textodialogo.visible_characters < $dialogoEmma/caixaDialogo/textodialogo.get_total_character_count(): # se caracteres visíveis < total de caracteres
			$dialogoEmma/caixaDialogo/textodialogo.visible_characters += 1 # adicionando caracteres visíveis
			
	else: # se caracteres visíveis = total de caracteres
		if index == 12 and Input.is_action_just_pressed("ui_accept") and $dialogoEmma/caixaDialogo/textodialogo.visible_characters == tamanho_elemento(texto[index]):
			index += 1
				
		elif index + 1 < texto.size() and Input.is_action_just_pressed("ui_accept"):
			$dialogoEmma/caixaDialogo/textodialogo.text = texto[index + 1]
			$dialogoEmma/caixaDialogo/textodialogo.visible_characters = 0
			index += 1 #adicionando (se possível) mais texto ao label ao apertar "Enter" e aumentando o index para iterar
						   # o próximo elemento da lista
				
						
		elif index < texto.size() and Input.is_action_just_pressed("ui_accept") and $dialogoEmma/caixaDialogo/textodialogo.text != texto[index]:
			$dialogoEmma/caixaDialogo/textodialogo.text = texto[index]
			$dialogoEmma/caixaDialogo/textodialogo.visible_characters = 0
			index += 1
				
				
	if Input.is_action_just_pressed("ui_accept"):
		$dialogoEmma/caixaDialogo/textodialogo.visible_characters = $dialogoEmma/caixaDialogo/textodialogo.get_total_character_count() #mostrando texto inteiro
			
	if index < 4:
		$dialogoEmma/rostoEmma.show()
		$dialogoEmma/rostoLuke.hide()
		$dialogoEmma/caixaDialogo/emma.show()
		$dialogoEmma/caixaDialogo/luke.hide()
		$dialogoEmma/rostoLino.hide()
		$dialogoEmma/caixaDialogo/lino.hide()
		
	elif index < 7:
		$dialogoEmma/rostoLuke.show()
		$dialogoEmma/rostoEmma.hide()
		$dialogoEmma/caixaDialogo/luke.show()
		$dialogoEmma/caixaDialogo/emma.hide()
		$dialogoEmma/rostoLino.hide()
		$dialogoEmma/caixaDialogo/lino.hide()
	
	elif index == 7:
		$dialogoEmma/rostoEmma.show()
		$dialogoEmma/rostoLuke.hide()
		$dialogoEmma/caixaDialogo/emma.show()
		$dialogoEmma/caixaDialogo/luke.hide()
		$dialogoEmma/rostoLino.hide()
		$dialogoEmma/caixaDialogo/lino.hide()
		
	elif index < 11:
		$dialogoEmma/rostoLuke.show()
		$dialogoEmma/rostoEmma.hide()
		$dialogoEmma/caixaDialogo/luke.show()
		$dialogoEmma/caixaDialogo/emma.hide()
		$dialogoEmma/rostoLino.hide()
		$dialogoEmma/caixaDialogo/lino.hide()
			
	if index == 11:
		$dialogoEmma.hide()
		$dialogoEmma/rostoEmma.hide()
		$dialogoEmma/rostoLuke.hide()
		$dialogoEmma/caixaDialogo/luke.hide()
		$dialogoEmma/caixaDialogo/emma.hide()
		$dialogoEmma/rostoLino.hide()
		$dialogoEmma/caixaDialogo/lino.hide()
		$raposa/sprite1.hide()
		$raposa/sprite2.hide()
		$raposa/ENTER.hide()
		
	elif index == 12:
		$dialogoEmma.show()
		$dialogoEmma/rostoEmma.show()
		$dialogoEmma/rostoLuke.hide()
		$dialogoEmma/caixaDialogo/emma.show()
		$dialogoEmma/caixaDialogo/luke.hide()
		
	elif index == 13:
		$dialogoEmma/rostoEmma.hide()
		$dialogoEmma/rostoLuke.hide()
		$dialogoEmma/caixaDialogo/emma.hide()
		$dialogoEmma/caixaDialogo/luke.hide()
		$dialogoEmma/rostoLino.show()
		$dialogoEmma/caixaDialogo/lino.show()
		
	elif index == 14:
		$dialogoEmma/rostoEmma.show()
		$dialogoEmma/rostoLuke.hide()
		$dialogoEmma/caixaDialogo/emma.show()
		$dialogoEmma/caixaDialogo/luke.hide()
		$dialogoEmma/rostoLino.hide()
		$dialogoEmma/caixaDialogo/lino.hide()
		
	elif index > 14 and index < 18:
		$dialogoEmma/rostoEmma.hide()
		$dialogoEmma/rostoLuke.hide()
		$dialogoEmma/caixaDialogo/emma.hide()
		$dialogoEmma/caixaDialogo/luke.hide()
		$dialogoEmma/rostoLino.show()
		$dialogoEmma/caixaDialogo/lino.show()
	
	if index == 19 and Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("final") #animação de entrada da tela
		yield(get_tree().create_timer(2), "timeout") 
		get_tree().change_scene("res://cenas/animacao.tscn")




func _on_area_body_entered(body):
	get_tree().change_scene("res://cenas/game_over.tscn")
