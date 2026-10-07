# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Homebrew tap for distributing custom CLI tools. Tap name: `shhac/tap`.

## Commands

```bash
# Install tap
brew tap shhac/tap

# Install a formula
brew install shhac/tap/toss

# Test a formula locally
brew test Formula/toss.rb

# Audit a formula for issues
brew audit --strict Formula/toss.rb

# Lint Ruby syntax
brew style Formula/toss.rb
```

## Adding a New Formula

1. Create `Formula/<name>.rb` following the existing pattern in `toss.rb`
2. Include platform-specific blocks (`on_macos`/`on_linux` with `on_arm`/`on_intel`) for multi-arch binaries
3. Provide sha256 checksums for each download URL
4. Include a `test` block that verifies basic functionality
