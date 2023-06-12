extends KinematicBody2D



var posicao = Vector2.ZERO #variável com duas medidas (x,y)
var gravidade = 20 #variável para demostrar gravidade
var jump_h = 700
 #variável para altura do pulo
#var jump_count = 0 #váriável para quantidade de pulos

func _physics_process(delta): 
	posicao.y += gravidade
	
	if Input.get_action_strength("ui_right"):
		posicao.x = 300
		$emma.play("run_right")
		$emma.flip_h = false
	elif Input.get_action_strength("ui_left"):
		posicao.x = -300
		$emma.play("run_left")
		$emma.flip_h = false
	else:
		posicao.x = 0
		$emma.play("idle_right")
		
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		posicao.y = -jump_h
	
	posicao = move_and_slide(posicao, Vector2.UP)
	

	
		

