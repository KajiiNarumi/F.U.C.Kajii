extends Node
export (PackedScene) var esperma
var score

func _raeady():
	randomize()

func nuevo_juego():
	score = 0
	$Player.inicio($posiciondeinicio.position)
	$iniciotimer.start()
	$interfaz.mostrar_mensaje("Ready?")
	$interfaz.update_score(score)
	$music.play()
	
func game_over():
#	get_tree().paused
	$scoretimer.stop()
	$espermatimer.stop()
	$interfaz.gamer_over()
	$music.stop()

func _on_iniciotimer_timeout():
	$espermatimer.start()
	$scoretimer.start()
	$AudioStreamPlayer.stop()
	
func _on_scoretimer_timeout():
	score += 1
	$interfaz.update_score(score)
	
func _on_espermatimer_timeout():
	$camino/espermaposicion.set_offset(randi())
	var E = esperma.instance()

	add_child(E)
	var D = $camino/espermaposicion.rotation + PI /2
	E.position = $camino/espermaposicion.position
	D += rand_range(-PI /4, PI /4)
	E.rotation = D
	E.set_linear_velocity(Vector2(rand_range(E.velocidad_minima, E.velocidad_maxima), 0).rotated(D))
	#if score = 2
	$espermatimer.wait_time -= 0.4
