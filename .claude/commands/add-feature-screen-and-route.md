---
name: add-feature-screen-and-route
description: Workflow command scaffold for add-feature-screen-and-route in echos-of-memories.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /add-feature-screen-and-route

Use this workflow when working on **add-feature-screen-and-route** in `echos-of-memories`.

## Goal

Implements a new screen for a feature and registers its route in the app router.

## Common Files

- `lib/features/*/presentation/screens/*_screen.dart`
- `lib/core/router/app_routers.dart`
- `lib/core/router/app_routers.gr.dart`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Create a new screen widget in presentation/screens/
- Register the new route in app_routers.dart and app_routers.gr.dart

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.