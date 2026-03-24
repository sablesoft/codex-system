---
name: terminal-link
description: Always use this skill when the user needs a local file link shown in console output. Emit clickable terminal links for local files so development artifacts can be opened directly from terminal output.
---

# Purpose

Emit terminal-friendly clickable links for files so development artifacts can be opened directly from terminal output.
This skill is the default path whenever the user needs a local file link shown in the console.

Engine-level entry points:

- `ruby scripts/file-link --path ...`
- `ruby scripts/image-link --path ...`

# Read before acting

- `AGENTS.md`
- `state/runtime.yaml`
- `state/terminal.yaml`
- `state/terminal.template.yaml`
- `.agents/rules/skill_rules.md`
- `.agents/rules/product_rules.md`
- relevant product `AGENTS.md` when a product file is involved

# Behavior

1. Resolve the target file path.
2. Confirm the file exists before emitting the link.
3. Read `state/terminal.yaml` before choosing the output shape.
4. If the local preferences file is absent, read `state/terminal.template.yaml`.
5. Prefer an OSC 8 clickable `file://` link to the absolute path.
6. If terminal preferences say OSC 8 works well, treat that OSC 8 link as the primary output and do not rewrite it into markdown or replace it with a plain path.
7. On macOS, provide a ready `open /absolute/path` fallback command only when terminal preferences allow or request that fallback.
8. Keep output lightweight so it can appear inline with dev workflow results.
9. Use `scripts/file-link` for generic files and `scripts/image-link` for image-specific terminal behavior.
10. If a product has additional image workflows such as saving previews back into cards, keep that product-specific behavior outside this skill.
11. Treat this skill as the default workflow whenever a console response needs to show a link to a local file.

# Constraints

- do not invent file paths
- do not emit a link to a file that does not exist
- do not duplicate product-specific preview-placement logic inside this skill
- do not mutate runtime or product data just to show a file link

# Output

1. resolved file path
2. clickable terminal link
3. optional local fallback command when useful
