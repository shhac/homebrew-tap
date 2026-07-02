class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.36.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "57c489d86e8f3f06ab4a90f5c1d1f87cacdbe88dec23321f15b6a247299edb23"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.36.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "1d2148d21e8ad45071749c48da7bd53d6625936caec89f5ac691ee9a058731d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.36.0/agent-slack-linux-arm64.tar.gz"
      sha256 "fb68e0139e6bd67a6ed79a771707794dae699b22979d130c23dddd10ad8d84b3"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.36.0/agent-slack-linux-amd64.tar.gz"
      sha256 "278b156a92768f1512f32fe5c008620e5c9cbc995c3a054de50f70d074f12b17"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.36.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
