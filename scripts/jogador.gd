extends Sprite2D

var velocidade = 10.5
var precionado = false

var pontos = 0

@onready var pontucao = $"../CanvasLayer/Control/Label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if precionado:
		var mouse_posicao = get_global_mouse_position()
		
		global_position = mouse_posicao


func cesto_precionado(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				precionado = true
				print("Começou a pressionar")
			else:
				precionado = false
				print("Soltou o botão")


func _algo_bateu(area: Area2D) -> void:
	if "ovo" in area.get_groups():
		area.get_parent().queue_free()
		pontos+=1
		pontucao.text = "Pontos: "+str(pontos)
