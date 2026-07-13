# Full Pack Output Template

Use these headings in this order. Omit only sections the user explicitly declined.

## 1. Source Analysis

- Source
- Content type
- Access status
- Core idea
- Audience
- Key source-backed facts
- Available visual material
- Important omissions

## 2. Source Integrity Block

Use the exact classification format from `references/source-integrity.md`.

## 3. Creative Direction

- Chosen angle
- Reader promise
- Recommended format
- Selected style ID or compatible pair
- Typography pairing
- Canvas
- Rationale

## 4. Headline Options

1. [Option]
2. [Option]
3. [Option]

Mark one `RECOMMENDED`.

## 5. Locked On-Image Copy

List every text unit exactly as it must appear.

## 6. Safe ChatGPT Images Prompt

Place the final self-contained prompt in one plain code block.

## 7. Experimental ChatGPT Images Prompt

Place the final self-contained prompt in one plain code block.

## 8. Google Flow Motion Prompt

Include the selected motion mode and the complete prompt.

## 9. LinkedIn Caption

Place the publish-ready caption in one plain code block.

## 10. X Output

Label it `Single post` or `Thread`, then provide the publish-ready copy.

## 11. QA Notes

Report only meaningful constraints or decisions, such as:

- A source claim was attributed rather than stated as fact
- A screenshot was not used because no verified image was supplied
- Carousel was selected because the copy exceeded single-image density

Do not dump the whole internal checklist.

## 12. Optional JSON

Produce only when requested. Use this shape:

```json
{
  "source": {
    "label": "",
    "type": "",
    "access_status": "FULL",
    "accessed": "YYYY-MM-DD"
  },
  "integrity": {
    "verified": [],
    "source_claims": [],
    "inferences": [],
    "unclear": [],
    "do_not_state_as_fact": []
  },
  "creative": {
    "angle": "",
    "format": "",
    "style_ids": [],
    "canvas": "1080x1350",
    "fonts": []
  },
  "copy": {
    "headline_options": [],
    "selected_headline": "",
    "on_image_units": []
  },
  "prompts": {
    "chatgpt_images_safe": "",
    "chatgpt_images_experimental": "",
    "google_flow": ""
  },
  "captions": {
    "linkedin": "",
    "x_mode": "single",
    "x": []
  }
}
```
