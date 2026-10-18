class_name ColourMixer

# The colour maths for the bowl. No XR code here, just numbers.
# "amounts" is a dictionary of how many parts of each colour are in
# the bowl, for example {"magenta": 1, "yellow": 2}.


# Mix paint (subtractive). Paint primaries are cyan, magenta and yellow.
# Each part of paint soaks up some light, so mixing makes colours darker.
static func mix_paint(amounts):
	var cyan = amounts.get("cyan", 0)
	var magenta = amounts.get("magenta", 0)
	var yellow = amounts.get("yellow", 0)

	# Empty bowl: nothing to mix.
	var biggest = max(cyan, magenta, yellow)
	if biggest == 0:
		return Color.WHITE

	# Divide by the biggest amount so the strongest colour is at full
	# strength and the others are a fraction of it.
	# 2 yellow + 1 magenta becomes yellow 1.0 and magenta 0.5 (orange).
	var c = cyan / float(biggest)
	var m = magenta / float(biggest)
	var y = yellow / float(biggest)

	# Turn CMY into RGB. Cyan soaks up red, magenta soaks up green,
	# and yellow soaks up blue.
	return Color(1 - c, 1 - m, 1 - y)


# How close two colours are, as a score from 0 to 100.
# 100 means exactly the same. Colours 1.0 or more apart score 0.
static func score(made, target):
	# Distance between the colours, like measuring with a ruler
	# in a 3D space where red, green and blue are the three axes.
	var red_gap = made.r - target.r
	var green_gap = made.g - target.g
	var blue_gap = made.b - target.b
	var distance = sqrt(red_gap * red_gap + green_gap * green_gap + blue_gap * blue_gap)

	var closeness = clamp(1.0 - distance, 0.0, 1.0)
	return int(round(closeness * 100))
