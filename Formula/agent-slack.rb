class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.27.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "4d9244ef03f3a60e7da6cec779426c4e331730bfd1aafc7d11a653723bd58672"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.27.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "242c645af24ff4ca8c49e8c7a6771f43f0cbd924eb664fe9fbf4dfd3f950ffed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.27.0/agent-slack-linux-arm64.tar.gz"
      sha256 "0ef7d088ebbef94b9d3f5d9593507a5a720a2d5b994fb00b81d8eb62c98de54b"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.27.0/agent-slack-linux-amd64.tar.gz"
      sha256 "9f0549f2c20850e27c2b6849c548347ff7dc1dd62ee30d23b95b89447e6ac855"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.27.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
