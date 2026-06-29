class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.32.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "1bfa173866d9a7fc088f95111cae08f46a081f68cdee1c884b7819433231938d"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.32.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "8c16547d314ba706b1357455291c5f20acd11a048c566bd09ab3307fdc93164c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.32.0/agent-slack-linux-arm64.tar.gz"
      sha256 "ddc2c39ca8fb61cdbb5f7ecdf172212751670795f1e35dd20bcf73a0555480ce"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.32.0/agent-slack-linux-amd64.tar.gz"
      sha256 "f75641f6c5ecc987f563c8eb410758b2417a87558e852a2fc34d40d0bd63d6ab"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.32.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
