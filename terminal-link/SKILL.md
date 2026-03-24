---
name: terminal-link
description: Always use this skill when the user needs a local file link shown in console output. Emit clickable terminal links for local files so development artifacts can be opened directly from terminal output.
---

# Purpose

Emit terminal-friendly clickable links for files so development artifacts can be opened directly from terminal output.
This skill is the default path whenever the user needs a local file link shown in the console.
Keep the skill self-contained by storing its preferences in `config.yaml` inside the same skill folder.

Skill-local entry points:

- `ruby scripts/file-link --path ...`
- `ruby scripts/image-link --path ...`

# Read before acting

- `SKILL.md`
- `config.yaml`
- `scripts/file-link`
- `scripts/image-link`
- the user request
- the target file path when one is provided

# Behavior

1. Resolve the target file path.
2. Confirm the file exists before emitting the link.
3. Read `config.yaml` from the same skill directory before choosing the output shape.
4. If `config.yaml` is missing, recreate it with the documented defaults from this skill and continue.
5. Prefer an OSC 8 clickable `file://` link when `config.yaml` says OSC 8 is supported and preferred.
6. If `config.yaml` says OSC 8 is unsupported or not preferred, fall back to the absolute path in plain text.
7. On macOS, provide a ready `open /absolute/path` fallback command only when `config.yaml` enables that fallback.
8. Use the labels from `config.yaml` when present; otherwise use the skill defaults.
9. Keep output lightweight so it can appear inline with dev workflow results.
10. Use `scripts/file-link` for generic file links and `scripts/image-link` for image-aware terminal behavior from inside this skill folder.
11. If the user asks to change terminal-link behavior, update `config.yaml` in this skill folder to match the request instead of storing those preferences anywhere else.
12. When updating `config.yaml`, preserve existing keys that are unrelated to the request.
13. After changing `config.yaml`, briefly confirm which settings were changed and where they are stored.

# Constraints

- do not invent file paths
- do not emit a link to a file that does not exist
- do not store terminal-link preferences in runtime, product state, or workspace state
- do not depend on sibling folders outside this skill directory for configuration
- do not depend on helper scripts outside this skill directory when the installed skill can carry its own copies
- do not overwrite unrelated user preferences in `config.yaml`

# Config

Default `config.yaml`:

```yaml
link:
  prefer_osc8: true
  osc8_supported: true
  include_open_fallback: false
  default_file_label: "[Open file]"
  default_image_label: "[Open image]"
```

# Output

1. resolved file path
2. clickable terminal link or plain absolute path, according to `config.yaml`
3. optional local fallback command when useful
4. updated config summary when the user asked to change preferences
