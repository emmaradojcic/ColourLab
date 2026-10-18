extends Node

# Checks the colour maths without the XR part of the game.
# Open tests/test_colour_mixer.tscn and press F6 (Run Current Scene).
# The results show in the Output panel.


func _ready():
	print("--- Paint mixing tests ---")
	check("cyan + yellow = green", {"cyan": 1, "yellow": 1}, Color(0, 1, 0))
	check("cyan + magenta = blue", {"cyan": 1, "magenta": 1}, Color(0, 0, 1))
	check("magenta + yellow = red", {"magenta": 1, "yellow": 1}, Color(1, 0, 0))
	check("all three = black", {"cyan": 1, "magenta": 1, "yellow": 1}, Color(0, 0, 0))
	check("2 yellow + 1 magenta = orange", {"yellow": 2, "magenta": 1}, Color(1, 0.5, 0))
	check("2 cyan + 2 yellow = same green", {"cyan": 2, "yellow": 2}, Color(0, 1, 0))
	check("just cyan = cyan", {"cyan": 3}, Color(0, 1, 1))
	check("empty bowl = white", {}, Color(1, 1, 1))
	print("--- Tests finished ---")
	# Close the test window, we only need the Output.
	get_tree().quit()


# Mix the amounts and say PASS or FAIL.
func check(test_name, amounts, expected):
	var result = ColourMixer.mix_paint(amounts)
	if result.is_equal_approx(expected):
		print("PASS  ", test_name)
	else:
		print("FAIL  ", test_name, "  got ", result, " expected ", expected)
