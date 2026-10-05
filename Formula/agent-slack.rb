class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.49.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "d7bc97aa67590f26b47edc7eb1fe0c19de7df4cd8c0b4cc3d4cd03cc0a4e61d7"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.49.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "de215252ff173febe8ee3a6347d497e0382c8c2cbbbaa94877327fe0fe7f7058"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.49.0/agent-slack-linux-arm64.tar.gz"
      sha256 "4c6dcc59cf56a31ace7f92f84fb2d9e6230a8f6d5aa477346f57302c69438ced"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.49.0/agent-slack-linux-amd64.tar.gz"
      sha256 "e0fd5bdaa4210bccdda7d6c2b825b259ee8c29df44eba86cd14983c1dc952dce"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.49.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
