class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.29.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "c5dc632e72e544ff89e59251cb4234be5da7e23949f17e04767dd11cf4c6cd10"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.29.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "4a260eeedff15507338fe0d1b6246a151ecd361dada95b07c12a9a62d7aa043b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.29.0/agent-slack-linux-arm64.tar.gz"
      sha256 "28b5b8243de8a7e4545e69234a7411d551304518e6013f66eca36374688e34dc"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.29.0/agent-slack-linux-amd64.tar.gz"
      sha256 "121a45179c1d6186779f057710f2dde78fc9b42df069e6e68f2d7c6d0d93032a"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.29.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
