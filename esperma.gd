extends RigidBody2D

export (int) var velocidad_minima
export (int) var velocidad_maxima

func _ready():#
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
