extends Sprite2D

var velocidade = 500
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var diracao_x = randf_range(-1.0, 1.0)
	
	position.x+=diracao_x * velocidade * delta
	
	var diracao_y = randf_range(-1.0, 1.0)
	
	position.y+=diracao_x * velocidade * delta
