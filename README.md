# Codex System

`codex-system` is a toolkit product for `product-engine` and a repository of installable Codex skills for system-level maintenance workflows.

## Purpose

It currently ships two skills:

- `skill-update`
- `terminal-link`

`skill-update` helps update previously installed Codex skills using a documented reinstall workflow.
It also documents how to interpret per-skill `VERSION` files.
`terminal-link` emits clickable terminal links for local files.

## Installation

Install `skill-update`, `terminal-link`, or both through `skill-installer` from the remote repository path that contains this product.

After installation, restart Codex so the newly installed skills are discovered.

## Host Expectations

- write temporary artifacts under `tmp/codex-system/`
- keep each installed skill self-contained
- do not rely on project-local `.agents/skills` discovery

## Layout

- `product.yaml` describes this toolkit product for `product-engine`
- each root folder with `SKILL.md` is an installable Codex skill

## Principle

System maintenance skills should stay small and explicit.  
Updates should be repeatable and documented.
