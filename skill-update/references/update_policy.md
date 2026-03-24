# Skill Update Policy

Current expected update flow:

1. identify the installed skill directory
2. compare the installed skill's `VERSION` file with the source skill's `VERSION` file when both are available
3. remove the existing installed copy
4. reinstall the skill from its repository path through `skill-installer`
5. restart Codex

Why this policy exists:

- `skill-installer` installs into `$CODEX_HOME/skills/<skill-name>`
- it aborts if the destination directory already exists
- therefore updates are currently modeled as reinstall rather than in-place overwrite
- the installed skill's own `VERSION` file is the portable source of truth for its local installed version

Recommended guidance:

- use semantic versioning in each skill's `VERSION` file
- patch version: bug fixes, wording fixes, safer defaults, and internal improvements that do not change the intended contract
- minor version: backward-compatible capability additions, broader adapter support, or new optional behaviors that keep the same skill identity
- major version: incompatible contract changes
- keep the same skill name across updates
- do not rename skills as part of the normal update lifecycle
- keep a `VERSION` file inside each shipped skill folder
