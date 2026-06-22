class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.21.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "d80c657a015be3af37540620c1d8a2707a04dafda5840b01c8f53792ff6a6593"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.21.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "5b7fb74e0f5e9560ecc327cc3728a2ac27329581db7ccae6a6fcab9937364a92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.21.0/agent-slack-linux-arm64.tar.gz"
      sha256 "aa9fd9257a76323b86a9220268ba4f74de70188a7f595cf8090554d08fee87c4"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.21.0/agent-slack-linux-amd64.tar.gz"
      sha256 "a900dea901fb9f56afd2b0e09eaf002c852f49015fa5c7f70dbd5023decb2138"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.21.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
