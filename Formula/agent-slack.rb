class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.47.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.47.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "6eb9623b130a84884633c5c3aaab82f2bac47c11bebe4963a428e7c0e2bffcc0"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.47.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "e69b46a90d484bc2e83c9a87a32ffcb0c5e80f82ac5fd55d9ae08977d19938be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.47.1/agent-slack-linux-arm64.tar.gz"
      sha256 "2a48b08de87763bc8f5aac3bf61c89c954effa0332f64ba9657b9fbf4932200e"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.47.1/agent-slack-linux-amd64.tar.gz"
      sha256 "f399b0f0133914d07eaa0cde8861f01328794e06eefaa417a46006da205d4f23"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.47.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
