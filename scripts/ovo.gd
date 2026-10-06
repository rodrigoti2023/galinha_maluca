extends Sprite2D

var velocidade = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible:
		position.y += velocidade * delta 
		
		if position.y > 3000:
			queue_free()
