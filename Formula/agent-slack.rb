class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.20.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "aff2d8703cbbff8156d58b3eea45da8a013445178b32b3ad24a55486c3e85d16"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.20.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "076602c98d665a14d776b1e004529b4cfb47297ef21a65a7ba9e80e8ccc541b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.20.0/agent-slack-linux-arm64.tar.gz"
      sha256 "7c4fa632285a1cf194c8cfdbbe5dbd435644ac9ecbcd3be9b0b7bdbf425f8031"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.20.0/agent-slack-linux-amd64.tar.gz"
      sha256 "5511be8de28d00f1e4a79de91a274883493f74bc6df467f9cb9e30390317cd07"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.20.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
