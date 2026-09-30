class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.48.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "90d88743240a9ad1e202940c675ab2495bd0bb2371fe282f99e79cea16afde96"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.48.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "60916acdc7816cf380783e17c1106c400b1c5d74269f9e5815fc33f554133fe2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.48.0/agent-slack-linux-arm64.tar.gz"
      sha256 "9c0f7cb6d617e88d3c58660fd5e1208b6e46031b76272ad1886aa63b708253fc"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.48.0/agent-slack-linux-amd64.tar.gz"
      sha256 "df7a5495364695875cc74c6baa37415a09eada68c0b9bb7cf9e169ba881dc8b9"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.48.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
