---
name: "distribute"
description: "Distribute Scamp by requiring a clean worktree, running the version bump skill, running mise push, then running mise distribute. Use when the user asks to distribute, release, upload, or ship Scamp to App Store Connect."
---

# Distribute

Use this skill when the user wants to distribute Scamp.

## Workflow

1. Verify there are no uncommitted changes before doing anything else:
   - Run `git status --porcelain`.
   - If there is any output, stop. Tell the user the worktree must be clean before distribution and summarize the dirty files.
2. Capture the current local state so the final summary can say what got pushed:
   - Record the current branch and `HEAD`.
   - Record recent commits that are not on the configured remotes when that information is available.
3. Run the `version bump` skill exactly as written.
   - If the version bump skill stops or fails, do not run distribution.
4. After the version bump commit succeeds, run `mise push`.
   - If `mise push` fails, report the failure and do not run distribution.
5. After `mise push` succeeds, run `mise distribute`.
   - Do not manually reimplement the distribution script.
   - If `mise distribute` fails, report the failure and where it stopped.
6. When done, summarize:
   - Old version and new version.
   - The version bump reasoning.
   - The commits that got pushed, including the `Version` commit.
   - Whether the macOS archive was uploaded.

## Guidance

- Keep the clean-worktree check strict. Do not stash, commit, or discard unrelated changes unless the user explicitly asks.
- Prefer `mise distribute` output as the source of truth for what uploaded.
- Mention that `mise push` ran before archiving, so the summary should identify the pushed branch and remotes when available.
