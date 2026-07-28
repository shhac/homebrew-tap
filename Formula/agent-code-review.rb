class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.27.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.27.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "7a0dbdfdce736a64f227e23054968dba9aee09c30ad23cc986657f1a7df043e2"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.27.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "cd29a506543319172b9d8eebba7bf5023c57205d160c584a88f83cba5c7fd497"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.27.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "9581ce5c1e3a5c815b9b07b2b5d4b515f114439c70797bee41723f8b9cc9c8cc"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.27.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "f48825125905e8ee164f9b9251215252a4981429779492716fbfac8b013612d2"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.27.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
