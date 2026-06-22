class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.25.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "c2ae78a76e1978af91232c340a8b23df3a7d2955cc99fb0119dd8e3d065c4af1"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.25.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "907b12916b2a9035c2048209ff6ee5ff24d87e5815e5708de1985687ff32ca31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.25.0/agent-slack-linux-arm64.tar.gz"
      sha256 "51df5e0d0b1da2567010506540aff34da88c78535a32dd7789f33fe37fce1e40"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.25.0/agent-slack-linux-amd64.tar.gz"
      sha256 "cd98420b6b80784601fde9d567abfce318b04e525daa3a564f3ce7ef9c315eed"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.25.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
