---
name: homebrew-formula
description: This skill should be used when adding or updating Homebrew formulas in this tap. Invoked for creating new formulas, updating versions, fixing formula issues, or managing multi-platform binary distributions.
allowed-tools: Read, Write, Edit, Bash, Grep, Glob
---

# Homebrew Formula Management

## Adding a New Formula

### 1. Gather Information

Check if formula already exists:
```bash
ls Formula/<name>.rb 2>/dev/null && echo "Formula exists - use update workflow"
```

Ask user for:
- Tool name and GitHub repository URL
- Current version to publish
- Brief description (under 80 chars)
- License type (MIT, Apache-2.0, GPL-3.0, etc.)

Determine binary distribution strategy:
- **Pre-built binaries** (recommended): Use when GitHub releases include platform-specific archives
- **Build from source**: Use when no pre-built binaries exist or only source tarballs are published

### 2. Get Download URLs and Checksums

For pre-built binaries, identify release assets for each platform:
- macOS ARM64 (Apple Silicon)
- macOS x86_64 (Intel)
- Linux ARM64
- Linux x86_64

Calculate SHA256 for each archive:
```bash
curl -sL "<url>" | shasum -a 256
```

For source builds, get the source tarball URL and hash:
```bash
curl -sL "https://github.com/<owner>/<repo>/archive/refs/tags/v<version>.tar.gz" | shasum -a 256
```

Inspect archive structure to determine install method:
```bash
curl -sL "<url>" -o /tmp/archive.tar.gz && tar -tzf /tmp/archive.tar.gz | head -20
```

### 3. Create Formula File

Create `Formula/<name>.rb` using patterns from `references/formula-reference.md`.

Formula requirements:
- Class name: CamelCase version of tool name
- Include `desc`, `homepage`, `version`, `license`
- Platform-specific blocks for multi-arch binaries
- `install` method to place binary in `bin`
- `test` block with meaningful verification

### 4. Validate Formula

Run in sequence:
```bash
brew style Formula/<name>.rb
brew audit --strict Formula/<name>.rb
brew install Formula/<name>.rb
brew test Formula/<name>.rb
```

Fix any issues before proceeding.

### 5. Commit and Push

Commit with message format: `Add <name> formula v<version>`

---

## Updating an Existing Formula

### 1. Update Version and URLs

Edit `Formula/<name>.rb`:
- Update `version` string
- Update all download URLs with new version
- Update all `sha256` checksums

### 2. Update Test Block

Ensure test block references correct version string if it checks `--version` output.

### 3. Validate and Commit

Run the same validation sequence as new formulas.

Commit with message format: `Update <name> to v<version>`

---

## Common Issues

### SHA256 Mismatch
Re-download and recalculate: `curl -sL "<url>" | shasum -a 256`

### Binary Not Found in Archive
Check archive structure: `tar -tzf <archive>.tar.gz`
Update `install` method to match actual binary path.

### Style Violations
Run `brew style --fix Formula/<name>.rb` for auto-fixable issues.

### Test Failures
- Verify binary runs: `./path/to/binary --version`
- Check test regex matches actual output format
- Use `--seed` or similar flags for deterministic test output
