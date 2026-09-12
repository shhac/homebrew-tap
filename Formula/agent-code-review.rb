class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.37.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.37.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "9458fc51935ea834856c7943c66a5bfffe1dc7483694e7377fbc7d591ed44f1c"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.37.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "221c120bd97a138fe4c4687fbab084883010067e735d278eb98ab33cf9a83b21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.37.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "04b46c1008e668beffedcc214d0bcee03f380ced293579de507549ae2a7998f8"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.37.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "79510446893866f032e11791ab5bc774d7a33cb3e7b18b40559bd3b4a1564931"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.37.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
