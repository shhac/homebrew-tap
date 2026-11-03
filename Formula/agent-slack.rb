class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.51.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "843a2bb38548cb8006488c90fac045d1988ce43ed04e5fd655cd5a74bf9481c9"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.51.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "f0ebcdf8bb936b5272a4af1d69247a02d6db35bdcd8f1de1ac83dfdff90562a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.51.0/agent-slack-linux-arm64.tar.gz"
      sha256 "1bcea83c1de36d49d15274523a213e7670d2c93ded9126a09beb8bb5965b07c8"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.51.0/agent-slack-linux-amd64.tar.gz"
      sha256 "55cf6bf68d3b838fdb4f6cd905a26c922331d0c981b6c6b3df603ca686277602"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.51.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
