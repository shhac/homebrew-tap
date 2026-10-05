class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.49.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "4f65ab520a9c54e38f38306bfb5c04ddeea5054b24b4a31d302514a4611102fc"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.49.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "501ae40449b4b5461ba69b3d6e5e2f8bed785401b1fdd91c51075e5bde46c2dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.49.1/agent-slack-linux-arm64.tar.gz"
      sha256 "b2d3ffc9f10f6c5acc97c415155abe98ef5b1191e8e6b91f81f928c9eeb594dc"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.49.1/agent-slack-linux-amd64.tar.gz"
      sha256 "b653658512d88acec7600df0d517cc7e016d73a39b99071c5306329d08f67b5f"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.49.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
