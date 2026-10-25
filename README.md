# Colour Lab

Name: Emma Radojcic

Student Number: C22369396

Class Group: TU858

Video:

# Description of the project

Colour Lab is an XR learning experience for the Meta Quest 3 that teaches how colour mixing works, and why mixing light is different from mixing paint. Glowing orbs of colour float in the learner's own room in passthrough. They drop them into a mixing bowl to match target colours, starting with paint (cyan, magenta and yellow), then discovering that light (red, green and blue) follows completely different rules.

**Proposal:** [jump to proposal](#proposal)

# Instructions for use

# How it works

# List of classes/assets in the project

| Class/asset | Source |
|-----------|-----------|
| MyClass.cs | Self written |
| MyClass1.cs | Modified from [reference]() |
| MyClass2.cs | From [reference]() |

# References
* Item 1
* Item 2

# What I am most proud of in the assignment

# What I learned

# Proposal

**Team:** Solo, Emma Radojcic (C22369396)
 
**Repo:** https://github.com/emmaradojcic/ColourLab
 
### What will the learner learn?
 
How colour mixing works, and why mixing light is different from mixing paint.
 
Most people learn in school that red and yellow make orange. Far less people know that red and green **light** make yellow, while red and green **paint** make a muddy brown. Screens, stage lights and the Quest itself all mix light, not paint. By the end the learner will be able to:
 
- Name the primary colours for light (red, green, blue) and for paint (cyan, magenta, yellow)
- Predict what two colours make when mixed in each mode
- Make tints and shades by adding white or black
- Explain in their own words why light and paint mix differently

### How will they learn it?
 
Colour Lab runs in passthrough, so glowing orbs of colour float in the learner's own room, next to a mixing bowl. Every orb dropped into the bowl adds one part of that colour, so the learner controls the **amounts**, not just which colours they use. Two parts magenta and one part yellow gives a different red than one of each.
 
Each level follows the same pattern:
 
1. **Show.** A short voice-over and animation shows orbs going into the bowl and the colour changing.
2. **Try.** A target colour appears next to the bowl, e.g. "Make orange". The learner drops orbs in, one at a time, watching the colour shift.
3. **Check.** When they're happy they press "Done" and get a score based on how close they got. If they're off, a hint tells them which way ("A bit too red, try more yellow"). An "Empty" button lets them start again.

### Levels
 
| Level | Topic | Example challenge |
|---|---|---|
| 1 | Paint primaries: cyan, magenta and yellow (subtractive mixing) | Make green from cyan and yellow paint |
| 2 | Amounts | Make orange, then a redder orange, by changing how much of each colour goes in |
| 3 | Light primaries: red, green and blue (additive mixing) | Make yellow from red and green light, which paint can't do |
| 4 | Light vs paint | Mix the same amounts in both modes and compare the results |
| 5 | Tints and shades | Make pink by adding white to red, or navy by adding black to blue |
| 6 | Final quiz | Match five target colours as closely as possible against the clock, mixed modes |
 
The learner starts with paint, which they already know from school, then discovers that light breaks those rules. From Level 3 on, a 3D button switches the bowl between "paint" and "light" mode so the learner can test the difference themselves.
 
### Interactions
 
- Grabbing orbs and dropping them into the bowl (XR Tools pickables)
- Pinching orbs with hand tracking
- Pressing buttons in 3D space for Done, Empty, the mode switch and the menu
- Walking around the room to collect orbs placed at different spots

### Feedback and progression
 
- A score for how close the mix is to the target, with stars per level
- Hints that say which colour to add more of
- Each colour has its own short sound, so the bowl plays a little chord as colours go in
- Haptic pulse on the controllers when a mix succeeds

### Technology
 
- **Godot 4.7** with GDScript
- **Godot OpenXR Vendors** for passthrough and hand tracking on the Meta Quest 3
- **Godot XR Tools** for pickables, buttons and UI in 3D
- **Hand Pose Detector** for a pinch gesture to grab or reset
- **Godot systems:** signals, tweens (merging and scaling orbs), GPU particles (mix bursts), shaders (glowing orbs), timers (quiz countdown), spatial audio, AnimationPlayer (level intros)
- **XR Simulator** for testing at home between lab sessions on the Quest

### Original content
 
- Orb models and materials made in Godot
- Sound effects and voice-over
- Any borrowed assets will be credited with links in the final README

### Plan
 
| Week of | Goal |
|---|---|
| 19 Oct | Finish Quest export setup. Orbs you can grab, running on the Quest in passthrough |
| 26 Oct | Mixing bowl that tracks amounts, paint mode, Level 1 |
| 2 Nov | Closeness scoring and hints, Level 2. **Proposal submitted by 6 Nov** |
| 9 Nov | Light mode and the mode switch, Level 3 |
| 16 Nov | Light vs paint, tints and shades, Levels 4–5 |
| 23 Nov | Final quiz, sound, particles and haptics |
| 30 Nov | Testing on real people and polish. README and video |
| 7 Dec | Buffer. **Final submission by 9 Dec** |


