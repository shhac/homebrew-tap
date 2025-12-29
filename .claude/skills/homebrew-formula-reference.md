# Homebrew Formula Reference

## Formula Templates

### Pre-built Binary Formula (Multi-Platform)

```ruby
class ToolName < Formula
  desc "Short description under 80 characters"
  homepage "https://github.com/owner/repo"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/owner/repo/releases/download/v1.0.0/tool-1.0.0-aarch64-macos.tar.gz"
      sha256 "abc123..."
    end
    on_intel do
      url "https://github.com/owner/repo/releases/download/v1.0.0/tool-1.0.0-x86_64-macos.tar.gz"
      sha256 "def456..."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/owner/repo/releases/download/v1.0.0/tool-1.0.0-aarch64-linux.tar.gz"
      sha256 "ghi789..."
    end
    on_intel do
      url "https://github.com/owner/repo/releases/download/v1.0.0/tool-1.0.0-x86_64-linux.tar.gz"
      sha256 "jkl012..."
    end
  end

  def install
    # Adjust based on archive structure (see "Common Archive Structures" below)
    binary = Dir["**/tool"].first
    bin.install binary
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tool --version")
  end
end
```

### Build from Source Formula

```ruby
class ToolName < Formula
  desc "Short description under 80 characters"
  homepage "https://github.com/owner/repo"
  url "https://github.com/owner/repo/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "abc123..."
  license "MIT"

  depends_on "rust" => :build  # or "go", "zig", etc.

  def install
    system "cargo", "install", *std_cargo_args
    # Or for Go:
    # system "go", "build", *std_go_args, "./cmd/tool"
    # Or for Zig:
    # system "zig", "build", "-Doptimize=ReleaseSafe"
    # bin.install "zig-out/bin/tool"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tool --version")
  end
end
```

---

## Common Archive Structures

### Flat Archive (binary at root)
```ruby
def install
  bin.install "tool"
end
```

### Nested Archive (binary in subdirectory)
```ruby
def install
  binary = Dir["**/tool"].first
  bin.install binary
end
```

### Renamed Binary in Archive
```ruby
def install
  bin.install "tool-darwin-arm64" => "tool"
end
```

---

## Test Block Patterns

### Version Check
```ruby
test do
  assert_match "tool 1.0.0", shell_output("#{bin}/tool --version")
end
```

### Version with Regex (flexible matching)
```ruby
test do
  assert_match version.to_s, shell_output("#{bin}/tool --version")
end
```

### Output Pattern Match
```ruby
test do
  output = shell_output("#{bin}/tool some-command")
  assert_match(/expected.*pattern/, output)
end
```

### Deterministic Test with Seed
```ruby
test do
  output = shell_output("#{bin}/tool --seed 42 input")
  assert_match "expected output", output
end
```

### Exit Code Check
```ruby
test do
  system bin/"tool", "--help"
end
```

### Combined Version and Functional Test
```ruby
test do
  assert_match version.to_s, shell_output("#{bin}/tool --version")
  output = shell_output("#{bin}/tool --seed 42 input")
  assert_match(/expected.*pattern/, output)
end
```

---

## Useful Brew Commands

```bash
# Validate Ruby syntax and style
brew style Formula/<name>.rb

# Auto-fix style issues
brew style --fix Formula/<name>.rb

# Comprehensive audit
brew audit --strict Formula/<name>.rb

# Install from local formula
brew install Formula/<name>.rb

# Run formula tests
brew test Formula/<name>.rb

# Uninstall for re-testing
brew uninstall <name>

# Check installed formula info
brew info <name>

# Inspect archive contents
tar -tzf <archive>.tar.gz
```

---

## Common License Identifiers

`MIT`, `Apache-2.0`, `GPL-2.0-only`, `GPL-3.0-only`, `BSD-2-Clause`, `BSD-3-Clause`, `MPL-2.0`, `ISC`, `Unlicense`

## Platform Architecture Names

| Platform | Homebrew Block | Common Archive Names |
|----------|---------------|---------------------|
| macOS ARM64 | `on_macos { on_arm }` | aarch64-macos, darwin-arm64, macos-aarch64 |
| macOS Intel | `on_macos { on_intel }` | x86_64-macos, darwin-x86_64, macos-x86_64 |
| Linux ARM64 | `on_linux { on_arm }` | aarch64-linux, aarch64-linux-gnu, linux-arm64 |
| Linux Intel | `on_linux { on_intel }` | x86_64-linux, x86_64-linux-gnu, linux-amd64 |
