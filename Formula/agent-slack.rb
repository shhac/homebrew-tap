class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.34.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "b65ab9cc0e17b7ce616893d0b6c8ab49234b1776a8129a5f466235bc06339638"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.34.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "c05ad27b12094c527b5452ecd5e0c378e28b37646e7b15a8d6e679673042548f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.34.0/agent-slack-linux-arm64.tar.gz"
      sha256 "4d735045009d173d3fb1c012af4c228941a454507b32513dc45e23b16e8d2da2"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.34.0/agent-slack-linux-amd64.tar.gz"
      sha256 "73a565329b08c98504107785aaa33b8f54b79954502e77f59333124c220394d6"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.34.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
