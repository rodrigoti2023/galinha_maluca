extends Sprite2D

var velocidade = 300
var direcao_x = 0
var direcao_y =0
var passos = 20
var acc_passos = 0

var margen = 10

var tempo_ovo = 2.5
var acc_tempo_ovo = 0

@onready var bunda = $bunda
@onready var ovo = $"../Ovo"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if acc_passos == 0:
		direcao_x = randf_range(-1.0, 1.0)
		direcao_y = randf_range(-1.0, 1.0)
		acc_passos = passos
	else:
		acc_passos -= 1
	
	var tela_tamanho = get_viewport().get_visible_rect().size
	
	if position.x + margen + direcao_x * velocidade < tela_tamanho.x && position.x  + margen + direcao_x * velocidade > 0:
		position.x+=direcao_x * velocidade * delta	
	
	if position.y  + margen + direcao_y * velocidade < tela_tamanho.y && position.y  + margen + direcao_y * velocidade > 0:
		position.y+=direcao_y * velocidade * delta
		
	if acc_tempo_ovo <= 0:
		colocar_ovo()
		var novo_tempo_ovo = randf_range(0.5, tempo_ovo)
		acc_tempo_ovo = novo_tempo_ovo
	else:
		acc_tempo_ovo-= 1*delta
		
func colocar_ovo():
	var novo_ovo = ovo.duplicate()
	novo_ovo.visible = true
	novo_ovo.position = bunda.global_position
	
	get_tree().current_scene.add_child(novo_ovo)
