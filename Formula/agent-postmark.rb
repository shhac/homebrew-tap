class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.6.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "d5db5f849433a93360bfcaa68e247859e1b5819e654a9000a38889a86983e42c"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.6.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "8f22485e543b2a4909ed6d946e93d3392407850d1abca9bad6c86d64717658a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.6.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "d55ccc089e3c0abb16451d941cb38d23cd436a7dd6fed92ea6a048f9fb31193d"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.6.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "5572dee4055a1191c24d3cdccf88dc09ba21d359b3aebeb40cdf2b57b4563406"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
