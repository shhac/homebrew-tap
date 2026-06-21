class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.10.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "29e21ab1015eccd103e8d6f72bad4932b2b03c9d096ebc72395c63a73a22a1b8"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.10.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "b64474421e66aa3074dd0117bad8a2364dcd24cb03da3aa3a9ce23026a0a2c2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.10.0/agent-dd-linux-arm64.tar.gz"
      sha256 "7913cde823d1b707acf8984ca370a4e988c2d326bbaaebd3eaf85aecdc1bf0db"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.10.0/agent-dd-linux-amd64.tar.gz"
      sha256 "4e5897c852201c43aeea5d104116aa703c6778b1980e735fc579b8b832e7db10"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
