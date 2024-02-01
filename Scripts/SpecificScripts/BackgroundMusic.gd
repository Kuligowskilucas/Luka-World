extends Node2D

var audio_player = AudioStreamPlayer.new()
var music_stream_path = "res://Sounds/trilhaSonora.mp3"

func _ready():
	audio_player.stream = load(music_stream_path)
	add_child(audio_player)

func play_music():
	if not audio_player.playing:
		audio_player.play()

func stop_music():
	if audio_player.playing:
		audio_player.stop()
