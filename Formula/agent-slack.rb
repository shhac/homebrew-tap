class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.48.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "8162b4509797a13b53eb47325a0cc07e4f078884cd31da1a6ac84f13a730f4fe"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.48.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "295d7209dc5fd01dc6ee62e1ec192264c6886a01a054ffed6faabe04e914e886"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.48.1/agent-slack-linux-arm64.tar.gz"
      sha256 "f4838f617e71c365b280da9548243dbc9f21d34b344f1abb19e38395b364cbc2"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.48.1/agent-slack-linux-amd64.tar.gz"
      sha256 "cbbb2d003135aaa32052f963ccb795aaf9c32cc7a88401b99dfa11287183dfbc"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.48.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
