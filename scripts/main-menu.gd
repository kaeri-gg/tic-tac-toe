extends Control

# Buttons
@onready var start_button: Button = %StartButton
@onready var enter_game_sfx: AudioStreamPlayer2D = %EnterGameSFX
@onready var timer: Timer = %Timer

const game_scene: = preload("res://scenes/game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.pressed.connect(on_start_button_pressed)

func on_start_button_pressed() -> void:
	enter_game_sfx.play()
	start_button.text = "Loading..."
	timer.start(1)
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(game_scene)
	timer.stop()
