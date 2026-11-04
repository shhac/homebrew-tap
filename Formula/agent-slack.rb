class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.52.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "d6dbcd930b5c377461f7bb41bbc24ffaac894aa4f7e46b04a1c9cb065111a7a8"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.52.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "c7496890539c30e9bf4a889a8f88e2c4453fd4b5926039483622acd38fa77089"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.52.1/agent-slack-linux-arm64.tar.gz"
      sha256 "396a96efc9f5d3d2bb56f481f29d7171d1045837a9be44bd5b9742efe30168b3"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.52.1/agent-slack-linux-amd64.tar.gz"
      sha256 "3fd15970ad1192ab9cab6d274b7f7977a3407aaf78d013452d32b4462527cfc6"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.52.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
