class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.44.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.44.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "ce2cf91672847a59685ec10cea3fb94228ff677264de4eb85bb409e8f4428146"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.44.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "d68c48c3cf9603da767690c15352542a543f9509769b2444be0cf01fdb9e78f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.44.0/agent-slack-linux-arm64.tar.gz"
      sha256 "b20ee87c3d0c8e375a3f936d20cdee5b1118db4be0db75c84af46ccf692050dd"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.44.0/agent-slack-linux-amd64.tar.gz"
      sha256 "2222f48905da71f197d0afcd3073f50476d781e68c2951b88fea0adb0997ccb8"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.44.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
