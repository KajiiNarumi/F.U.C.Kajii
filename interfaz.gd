extends CanvasLayer

signal iniciar_juego
var iniciar = true

func mostrar_mensaje(texto):
	$mensaje.text = texto
	$mensaje.show()
	$mensajeTimer.start()
	
func gamer_over():
	$gameover.play()
	mostrar_mensaje("YOU ARE")
	yield($mensajeTimer, "timeout")
	mostrar_mensaje("PREGNANT")
	yield($mensajeTimer, "timeout")
	mostrar_mensaje("now take care of your")
	yield($mensajeTimer, "timeout")
	mostrar_mensaje("BIG responsibility")
	yield($mensajeTimer, "timeout")
	$gameover.stop()
	mostrar_mensaje("Good Bye")
	yield($mensajeTimer, "timeout")
	get_tree().quit()
	
func update_score(puntos):
	$scorelabel.text = str(puntos)

func _on_mensajeTimer_timeout():
	$mensaje.hide()
	
func _on_buttonplay_pressed():
	$buttonplay.hide()
	emit_signal("iniciar_juego")
	iniciar = false

func _process(delta):
	if Input.is_action_pressed("ui_accept") && iniciar:
			$buttonplay.hide()
			emit_signal("iniciar_juego")
			iniciar = false
			
