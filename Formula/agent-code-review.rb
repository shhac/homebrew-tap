class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.7.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.7.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "d0b77b36087577d3a9473f6c6483d912827d5a1d66588eae381db68036d98a92"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.7.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "fd27b35fb56865f8be4a69c44d21bc17eb6973773b0d554e3f3bf79841b634d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.7.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "59468bf2806d3f15bd0c710666c09108ab0715125fb397d0afa460df9704d273"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.7.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "8d509bec7cfba7eb4a010da5bf8e4af6dd0188822990f45d366d916053fff2cd"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
