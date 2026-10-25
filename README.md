# Colour Lab

Name: Emma Radojcic

Student Number: C22369396

Class Group: TU858

Video:

# Description of the project

Colour Lab is an XR learning experience for the Meta Quest 3 that teaches how colour mixing works, and why mixing light is different from mixing paint. It runs in passthrough, so everything happens in the learner's own room. They splat paint onto their real walls, shine coloured torches to mix light, and use a mixing bowl to get amounts exactly right. Along the way they discover that paint (cyan, magenta and yellow) and light (red, green and blue) follow completely different rules.

**Proposal:** [jump to proposal](#proposal)

# Instructions for use

# How it works

# List of classes/assets in the project

| Class/asset | Source |
|-----------|-----------|
| To be completed | |

# References
* To be completed

# What I am most proud of in the assignment

# What I learned

# Proposal

**Team:** Solo, Emma Radojcic (C22369396)

**Repo:** https://github.com/emmaradojcic/ColourLab

### What will the learner learn?

How colour mixing works, and why mixing light is different from mixing paint.

Most people learn in school that red and yellow make orange. Far fewer people know that red and green **light** make yellow, while red and green **paint** make a muddy brown. Screens, stage lights and the Quest itself all mix light, not paint. By the end the learner will be able to:

- Name the primary colours for paint (cyan, magenta, yellow) and for light (red, green, blue)
- Predict what two colours make when mixed as paint and as light
- Control the result by changing the amounts of each colour
- Make tints and shades by adding white or black
- Explain in their own words why light and paint mix differently

### How will they learn it?

Colour Lab has three ways to mix colour, each built around a different interaction:

**Paint mode: splat paint on your walls**
The learner grabs paint pots and pours or flicks paint onto the real walls of their room. Each throw leaves a paint splat, and where splats overlap the colours mix like real paint, getting darker as more colours are added (subtractive mixing).

**Light mode: shine torches on your walls**
The learner picks up red, green and blue torches and points the beams at a wall. Where two beams overlap they see the mixed colour: red and green make yellow, green and blue make cyan, and all three make white. Colours get brighter as more are added (additive mixing). This is how stage lighting works.

**Bowl mode: get the amounts exactly right**
For precise challenges, the learner drops colour orbs into a mixing bowl. Every orb adds one part of that colour, so they control the **amounts**, not just which colours they use. Two parts magenta and one part yellow gives a different red to one of each. A 3D switch on the bowl changes it between paint rules and light rules.

Each level follows the same pattern:

1. **Show.** A short voice-over and animation demonstrates the idea.
2. **Try.** A target colour appears, e.g. "Make orange". The learner mixes, watching the colour change as they go.
3. **Check.** They press "Done" and get a score based on how close they got. If they're off, a hint tells them which way ("A bit too red, try more yellow"). A reset button lets them start again.

### Levels

| Level | Topic | Mode | Example challenge |
|---|---|---|---|
| 1 | Paint primaries: cyan, magenta and yellow | Paint | Splat cyan and yellow on the wall to make green |
| 2 | Amounts | Bowl | Make orange, then a redder orange, by changing how much of each colour goes in |
| 3 | Light primaries: red, green and blue | Light | Make a yellow spot on the wall using red and green torches, which paint can't do |
| 4 | Light vs paint | Paint and Light | Splat red and green paint next to red and green light beams and compare: brown vs yellow |
| 5 | Tints and shades | Bowl (paint rules) | Make pink by adding white to red, or navy by adding black to blue |
| 6 | Final challenge | All three | Match five target colours as closely as possible against the clock |

The learner starts with paint, which they already know from school, then discovers that light breaks those rules. Level 4 puts both side by side on the same wall so they can see the difference for themselves.

### Interactions

- Grabbing paint pots, torches and orbs (XR Tools pickables)
- Pouring and flicking paint at the walls, using the throw speed and direction
- Pointing torches to aim light beams
- Dropping orbs into the bowl
- Pinching with hand tracking to grab and reset
- Pressing buttons in 3D space for Done, Reset, the bowl's paint/light switch and the menu
- Walking around the room to reach different walls

### Feedback and progression

- A score for how close the mix is to the target, with stars per level
- Hints that say which colour to add more of
- Each colour has its own short sound, so mixing plays a little chord
- Particle bursts and splat animations when paint hits the wall
- Haptic pulse on the controllers when a mix succeeds (when using controllers)

### How the colour mixing works

Getting the maths right is the core of the project, because a wrong model would teach the wrong thing.

- **Paint** uses a subtractive model: colours are combined by multiplying them (a weighted version for amounts), so mixing makes colours darker, the way pigments absorb light. I will also look at pigment-mixing approaches like Mixbox for more realistic results.
- **Light** uses an additive model: colours are added together and clamped, so mixing makes colours brighter. On the walls, this comes naturally from overlapping SpotLight3D beams in Godot.
- **Scoring** measures the distance between the mixed colour and the target colour.

### Technology

- **Godot 4.7** with GDScript
- **Godot OpenXR Vendors** for passthrough, hand tracking and the Meta Scene SDK (to find the walls in the learner's room)
- **Godot XR Tools** for pickables, buttons and UI in 3D
- **Hand Pose Detector** for a pinch gesture to grab or reset
- **Godot systems:** signals, tweens, GPU particles (splats and mix bursts), shaders (glowing orbs and light beams), decals (paint splats on walls), SpotLight3D (torches), timers (final challenge countdown), spatial audio, AnimationPlayer (level intros), scene switching between levels
- **XR Simulator** for testing at home between lab sessions on the Quest

### Original content and style

- A consistent "colour lab" look: glass paint pots, chunky torches and a ceramic mixing bowl, all made by me
- Sound effects and voice-over recorded by me
- Any borrowed assets will be credited with links in the final README

### Scope

**Core:** bowl mode with paint and light rules, light mode with torches, Levels 2 to 5, scoring and hints. If wall splats aren't ready, Level 1 runs in the bowl.

**Stretch:** paint splats on real walls with the Meta Scene SDK, voice-over, the timed final challenge, hand-tracking pinch, and a pull request to one of the starter repos.

### Testing and project management

- Testing with classmates from mid-November, not just at the end, so there's time to act on feedback
- Feature branches for each mode, with regular commits and clear messages

### Plan

| Week of | Goal |
|---|---|
| 19 Oct | Quest export set up. Objects you can grab, running on the Quest in passthrough |
| 26 Oct | Colour mixing model for paint and light, tested. Bowl mode with amounts, Level 2 |
| 2 Nov | Torches and light mode, Level 3. **Proposal submitted by 6 Nov** |
| 9 Nov | Paint mode on the walls (Scene SDK and splats), Level 1. First test with classmates |
| 16 Nov | Light vs paint, tints and shades, Levels 4 and 5. Scoring and hints in every mode |
| 23 Nov | Final challenge, sound, voice-over, particles and haptics |
| 30 Nov | Second round of testing and polish. README and video |
| 7 Dec | Buffer. **Final submission by 9 Dec** |