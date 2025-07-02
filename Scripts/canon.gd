extends Sprite2D

var bullet = preload("res://Scenes/Bullet.tscn")
var directions = [-0.9, 0, 0.9]
var rotations = [-37, 0, 37]
var currentDir = 1
var audio: AudioPlayer

func _ready() -> void:
	audio = get_node("../../AudioStreamPlayer") as AudioPlayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		RotateCanon(+1)
	if Input.is_action_just_pressed("ui_left"):
		RotateCanon(-1)
	if Input.is_action_just_pressed("ui_accept"):
		var bull = bullet.instantiate() as Bullet
		get_parent().add_child(bull)
		bull.position = position
		bull.direction = Vector2(directions[currentDir],-1)
		audio.Play("Shoot1")
		
func RotateCanon(dir):
	if currentDir == 0 and dir == -1:
		return
	if currentDir == 2 and dir == +1:
		return
	currentDir += dir
	rotation_degrees =  rotations[currentDir]
	audio.Play("canonmove")
	
