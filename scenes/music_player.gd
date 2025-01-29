class_name MusicPlayer
extends Node

var songs: Array[AudioStreamPlayer]
var current_song: AudioStreamPlayer

func _ready() -> void:
	for child in get_children():
		songs.append(child as AudioStreamPlayer)

func play_song(song: int) -> void:
	if current_song:
		current_song.stop()
	current_song = songs[song]
	current_song.play()
