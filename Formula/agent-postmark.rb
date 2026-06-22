class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.10.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "d5769167bd1c061e0d98185b9fccca6c38579485732fc2261a5fe5523d91f0d0"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.10.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "0d3eadb379c780b2fc23184a5e7147f6506ee976e4b291045ce3680433cf5da2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.10.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "0ec2bd5f19fa57fff19511286119f244fdd188e65695ebad5ff5e2cbcd338050"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.10.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "6b178e3c68aa3022383256a5452190fe0fb4a9742567a890bdb4499d4bbd9d66"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
