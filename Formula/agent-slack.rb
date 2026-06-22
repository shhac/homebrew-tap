class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.23.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "8bc0d3f613a43f88050be76045bdeb98eb2893727c4467e268ad5eece26946b8"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.23.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "48a9c575d41f8bbc10d529f45cb3dce1072d76899b3e3e7a2c296d716fe1dbd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.23.0/agent-slack-linux-arm64.tar.gz"
      sha256 "a10e4ade7f8672feb5b6fddf6284c289d01e960221de1a79aaa962fdbfcf24eb"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.23.0/agent-slack-linux-amd64.tar.gz"
      sha256 "d58d8d52862ea6a19f6d723e494fab6de0fdb552f2e62eb3f467f3e4bac6de59"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.23.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
