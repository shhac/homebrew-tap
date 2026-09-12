class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.36.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.1/agent-code-review-darwin-arm64.tar.gz"
      sha256 "67fe62d702aa25fa68677a81c1173fbe38d5d4ed6e573bfd16c25e8d4397d198"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.1/agent-code-review-darwin-amd64.tar.gz"
      sha256 "7e0536be55b6d0ed252f2062a18a4bc1475ff5791b06e695bd7f20e44bb4f32d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.1/agent-code-review-linux-arm64.tar.gz"
      sha256 "216520ebcd42c75f16609e4158e5e5fbb99eea2a1e0bb456d8b39ccc127e1c03"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.36.1/agent-code-review-linux-amd64.tar.gz"
      sha256 "0e6ed46ad409827d19887a6406d8eaf37a9ed3bb749985ff5b577f28e714d2f9"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.36.1", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
