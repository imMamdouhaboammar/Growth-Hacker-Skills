# Google Flow Motion Prompt Template

Replace every bracketed field before output.

```text
Animate the supplied editorial graphic in Google Flow as a silent [6]-second [seamless loop, motion poster, or parallax editorial motion].

SOURCE FRAME LOCK
Use the supplied image as the exact visual source. Preserve the canvas ratio, layout, colours, typography, spelling, numbers, logos, icons, card positions, borders, and hierarchy.

MOTION PLAN
- [0.0 to 1.0s: exact movement]
- [1.0 to 3.0s: exact movement]
- [3.0 to 5.0s: exact movement]
- [5.0 to 6.0s: exact hold or return]

ALLOWED MOVEMENT
- [Connector line draw, small highlight pulse, 2 to 6 pixel icon float, mask reveal, subtle background parallax]
- Keep all text-bearing panels stable and readable.

STRICT CONSTRAINTS
- No audio and no sound effects
- Do not rewrite, regenerate, morph, scramble, blur, or replace text
- Do not add text, labels, logos, objects, interface elements, particles, or decorations
- Do not redesign the layout
- Do not change colours or fonts
- Do not crop important content
- Do not rotate or bend text panels
- Do not use aggressive zoom, shake, or fast camera motion
- Do not create lip movement or characters speaking

LOOP AND GIF READINESS
- Hold the final readable state for at least 0.8 seconds
- Make the first and last frames visually compatible
- Keep full-frame movement limited to reduce GIF size and looping jumps
- End with all source text fully visible and unchanged
```
