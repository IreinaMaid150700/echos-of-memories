---
name: add-feature-cubit-and-state
description: Workflow command scaffold for add-feature-cubit-and-state in echos-of-memories.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /add-feature-cubit-and-state

Use this workflow when working on **add-feature-cubit-and-state** in `echos-of-memories`.

## Goal

Implements a new feature's state management using Cubit (with Freezed), and adds corresponding unit tests.

## Common Files

- `lib/features/*/presentation/cubit/*_cubit.dart`
- `lib/features/*/presentation/cubit/*_cubit.freezed.dart`
- `lib/features/*/presentation/cubit/*_state.dart`
- `test/features/*/*_cubit_test.dart`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Create Cubit class for the feature in presentation/cubit/
- Generate or update Freezed state and Cubit files
- Write or update unit tests for the Cubit in test/features/[feature]/

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.