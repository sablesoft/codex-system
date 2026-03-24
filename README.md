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

After installation, restart Codex so the newly installed skills are discovered.

## Host Expectations

- keep each installed skill self-contained

## Layout

- `product.yaml` describes this toolkit product for `product-engine`
- each root folder with `SKILL.md` is an installable Codex skill

## Principle

System maintenance skills should stay small and explicit.  
Updates should be repeatable and documented.
