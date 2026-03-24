# Codex System

`codex-system` is a toolkit repository of installable Codex skills for system-level maintenance workflows.

## Purpose

It currently ships two skills:

- `skill-update`
- `terminal-link`

## Skills

- `skill-update` updates previously installed Codex skills through the documented reinstall workflow and interprets per-skill `VERSION` files.
- `terminal-link` emits clickable terminal links for local files in console output.

## Installation

Install `skill-update`, `terminal-link`, or both through `skill-installer` from the remote repository path that contains this product.

Install `skill-update`:

```text
$skill-installer install https://github.com/sablesoft/codex-system/tree/main/products/codex-system/skill-update
```

Install `terminal-link`:

```text
$skill-installer install https://github.com/sablesoft/codex-system/tree/main/products/codex-system/terminal-link
```

Install both skills:

```text
$skill-installer install the skills from sablesoft/codex-system at paths products/codex-system/skill-update and products/codex-system/terminal-link
```

After installation, restart Codex so the newly installed skills are discovered.

## Updating

If `skill-update` is installed, you can update these skills through the standard reinstall workflow.

Natural-language prompts:

```text
Use skill-update to update the installed skill-update skill from https://github.com/sablesoft/codex-system/tree/main/products/codex-system/skill-update
```

```text
Use skill-update to update the installed terminal-link skill from https://github.com/sablesoft/codex-system/tree/main/products/codex-system/terminal-link
```

```text
Use skill-update to update the installed skill-update and terminal-link skills from the codex-system repository paths:
- products/codex-system/skill-update
- products/codex-system/terminal-link
```

`$skill-update` prompts:

```text
$skill-update update the installed skill-update skill from https://github.com/sablesoft/codex-system/tree/main/products/codex-system/skill-update
```

```text
$skill-update update the installed terminal-link skill from https://github.com/sablesoft/codex-system/tree/main/products/codex-system/terminal-link
```

```text
$skill-update update the installed skill-update and terminal-link skills from the codex-system repository paths:
- products/codex-system/skill-update
- products/codex-system/terminal-link
```

## Host Expectations

- keep each installed skill self-contained

## Layout

- `product.yaml` describes this toolkit product for `product-engine`
- each root folder with `SKILL.md` is an installable Codex skill

## Principle

System maintenance skills should stay small and explicit.  
Updates should be repeatable and documented.
