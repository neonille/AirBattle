extends AudioStreamPlayer

class_name AudioPlayer

var sounds = [
	preload("res://Sound/blipSelect1.wav"),
	preload("res://Sound/click1.wav"),
	preload("res://Sound/explosion1.wav"),
	preload("res://Sound/explosion2.wav"),
	preload("res://Sound/Shoot1.wav")
]

func Play(name):
	var res = "res://Sound/{0}.wav".format([name])
	stream = load(res)
	play()
