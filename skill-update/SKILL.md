---
name: skill-update
description: Update an installed Codex skill by checking its current installation, removing the old copy when needed, reinstalling it from the source repository, and reminding the user to restart Codex.
---

# Purpose

Provide a repeatable update workflow for Codex skills that were previously installed through `skill-installer`.

# Read before acting

- `references/update_policy.md`
- `templates/update_checklist.md`

# Behavior

1. Identify which installed skill or skills the user wants to update.
2. Determine the installation target directory, normally `$CODEX_HOME/skills` or `~/.codex/skills`.
3. Check whether the target skill directory already exists and inspect its local `VERSION` file when present.
4. Determine the source skill version by reading the source repository's `VERSION` file when available.
5. Interpret the version change using the semver policy from `references/update_policy.md`.
6. Explain that the current update workflow is a reinstall workflow because `skill-installer` aborts when the destination directory already exists.
7. Remove the old installed skill directory only after the user has clearly requested the update action.
8. Reinstall the skill from the requested repository path or GitHub URL.
9. Remind the user to restart Codex so the updated skill is discovered.
10. Present the result to the user in the console using the structure from `templates/update_checklist.md`.
11. Summarize what was updated and any manual follow-up that remains.

# Constraints

- do not pretend that `skill-installer` supports in-place overwrite when it does not
- do not delete an installed skill directory unless the update action is explicit
- do not claim a version comparison unless you actually read the relevant `VERSION` files
- do not rename installed skills as part of the update workflow
- do not leave the user without a clear reinstall command or source path
- do not assume a project-local `.agents/skills` layout is the installation source of truth

# Output

1. clear update plan
2. reinstall action or command
3. restart reminder
4. console output structured with `templates/update_checklist.md`
