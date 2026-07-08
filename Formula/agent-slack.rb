class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.43.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.43.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "c2df91d96a25a40a222398dae4a5b0ec93684c3703167c883a943af07d8c9c9e"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.43.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "39b030cfd9daf069821624d58e7acd042e623a68c97b7d19285bf98f7be6dd35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.43.1/agent-slack-linux-arm64.tar.gz"
      sha256 "5d70595763fc9bbcae9167ab9fcfb66ad00dd486afe0016ba0d0a20b84eff85d"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.43.1/agent-slack-linux-amd64.tar.gz"
      sha256 "44483ca4cf36542359dfc6184c370c320609b69b4ad583d99bc8032244b48d9e"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.43.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
