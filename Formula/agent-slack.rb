class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.28.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "62ec666c8340db9ca434124debd1130feed639929efed11f91f123484ff1776c"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.28.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "1cb79f40d1e0920c92327e26882ed7099420153317ea3343e250b06e55cc13d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.28.0/agent-slack-linux-arm64.tar.gz"
      sha256 "666d3b9690fbfc0dace22d1476e505c41056b1b2341d50d337205e58c9641bc8"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.28.0/agent-slack-linux-amd64.tar.gz"
      sha256 "a4459f85ad899aef99984d03625c01d5f5f7988616e900619aaf334916243633"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.28.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
