extends Node

# Runs the game: checks the player's mix against the target.
# Later this will also move between levels.

# The scene's bowl and target sign. Set these in the Inspector.
@export var bowl: Bowl
@export var target_display: TargetDisplay


# Called by the Done button's signal (connected in main.tscn).
func _on_done_button_pressed(_button):
	check_mix()


# Compare the bowl with the target and show a score.
func check_mix():
	if bowl.amounts.is_empty():
		target_display.show_result("The bowl is empty!")
		return

	var score = ColourMixer.score(bowl.get_colour(), target_display.target_colour)
	print("Score: ", score)
	target_display.show_result(str(score) + "%  " + get_message(score))


# A short message to go with the score.
func get_message(score):
	if score >= 90:
		return "Perfect!"
	elif score >= 70:
		return "Close!"
	else:
		return "Keep trying"
