# AGENTS.md

This file is for coding agents working in the `seamless-glance-distro`
repository.

## Purpose

`seamless-glance-distro` is the public distribution channel for Seamless Glance,
the terminal-native, read-only AWS operations dashboard (a Rust TUI). This repo
hosts the `install.sh` bootstrap script and the released, prebuilt binaries that
users download. The application source lives in `seamless-glance`.

Because `install.sh` is executed via `curl | bash` on user machines, treat it as
security-sensitive: it must fail closed, verify what it downloads, and never do
anything surprising to the host.

## Working Standards (fells-code baseline)

These rules apply to every repository in the fells-code org. Repo-specific
guidance may extend them but must not contradict them.

### Attribution
- Commit and open PRs solely under the repository owner's identity. Never
  commit under an agent or assistant identity.
- Never attribute work to an AI assistant: no `Co-Authored-By: Claude` (or any
  assistant) trailers, no "Generated with" / "Created with Claude" notes, and no
  assistant branding or emoji anywhere in commit messages, PR or issue titles
  and descriptions, changesets, code comments, or docs.

### Comments
- Comment only when the code genuinely needs explaining: a non-obvious reason, a
  gotcha, or an invariant. Never narrate what the code plainly does.

### TODOs
- Every `TODO`/`FIXME` must reference a ticket, e.g. `# TODO(#123): ...`.
  Do not leave a bare TODO. If no ticket exists, create one first.

### Commits & branches
- Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`, `ci:`, `test:`).
- Descriptive branch names (`feat/...`, `fix/...`); never a `claude/` or other
  tool-generated prefix.

### Public-facing text
- No em dashes in commit messages, code comments, PR or issue text, changesets,
  or docs. Use a comma, parentheses, or a separate sentence.

### Before declaring work done
- All checks that apply must pass before you open a PR or call the work done.
  For `install.sh` that means `shellcheck install.sh` and a real end-to-end run
  of the installer on macOS and Linux. Run them and report the real output; do
  not open a PR while any check is failing.
- Match the surrounding code's style, naming, and comment density.

## Layout

```text
install.sh   OS/arch detection + release-binary download and install
README.md     user-facing install and usage docs
```

## How Install Works

- `install.sh` detects OS and architecture, selects the matching
  `seamless-glance-<version>-<target>` release asset, downloads it, and installs
  it (default `INSTALL_DIR=/usr/local/bin`) as `seamless-glance` with a `glance`
  alias.
- When cutting a release, keep the `VERSION` in `install.sh`, the published
  release assets, and the README in sync so the installer resolves real files.

## Safe Change Workflow

1. Run `shellcheck install.sh`.
2. Test the installer end to end on macOS (arm64 and x86_64) and Linux.
3. Verify version, asset names, and README instructions all agree before a
   release.
