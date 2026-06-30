class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.34.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.34.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "272361e673726b52f4427fc10979d4e4062bde4cb356fb03fee69d9b8b507808"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.34.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "e2544ac5dd1188efa7896462ac01eca61a5f9cd9197d3fac62b75b255aa3eff9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.34.1/agent-slack-linux-arm64.tar.gz"
      sha256 "719042e0a9558f8c2a994b1f7334efc0d5be60fefe1a8dd61257500ae7f7799e"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.34.1/agent-slack-linux-amd64.tar.gz"
      sha256 "6c5fdbf9a810a712b20293179cff611bcb67cf23e70b29b4cd40b1218098194d"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.34.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
