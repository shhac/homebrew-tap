class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.40.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "8b428130fb6ea06e71c8894aee7dc97274a20cfb6f3ca0ed29b0566cdacdcddd"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.40.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "fe0ae3be93d0fbeddcd24944d3a76783a37129a1c34a69272c71e7545ac8123f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.40.0/agent-slack-linux-arm64.tar.gz"
      sha256 "05ba70fdf024c269727273b1d0658e6e0b7af93e3ba76c0e94c7a7486014df52"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.40.0/agent-slack-linux-amd64.tar.gz"
      sha256 "b98095dfc44480669865d5d76c5437f06f5e08576ac136d26179e684fc2fbd68"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.40.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
