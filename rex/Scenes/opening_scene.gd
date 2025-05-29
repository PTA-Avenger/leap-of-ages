extends CanvasLayer

@onready var label = $Label
@onready var continue_button = $ContinueButton
@onready var intro_sound = $IntroSound

var full_text := """LEAP OF AGES: EVERY JUMP ECHOES THROUGH ETERNITY

100 years ago, the first rupture tore through the timeline.
Reality fractured — not instantly, but like glass under pressure.
The Archives vanished. Voices became echoes. Time forgot itself.
Now, only REX remains — not by chance, but by design.
Each jump rewinds the silence. Each echo speaks of a world undone.
REX must jump again.

CREATED BY:
Komane Kamogelo
Mabena Thato
Mosia Thabang
Tabwaka Nathan
"""

var char_index := 0
var typing_finished := false

func _ready():
	label.text = ""
	continue_button.visible = false
	continue_button.disabled = true
	continue_button.connect("pressed", Callable(self, "_on_continue_button_pressed"))

	if intro_sound.stream:
		intro_sound.play()

	start_typewriter()

func start_typewriter():
	await get_tree().create_timer(0.03).timeout
	if char_index < full_text.length():
		label.text += full_text[char_index]
		char_index += 1
		start_typewriter()
	else:
		typing_finished = true
		continue_button.visible = true
		continue_button.disabled = false
		intro_sound.stop()

func _on_continue_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/my_main.tscn")
