class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.44.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "dfca20fd03617a4757b109b36b7e9ba12cc64fd0af96603d83829c8feb8b5232"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.44.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "6e64e2b48292bb77701a41cb957285cac6f7ac1bf52f9f903f4a7184cd3d27d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.44.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "1d131bc4521ea859c55373347ea0c1af0fd7ba4a585d9e16600bff7f1e624268"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.44.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "133c1a0bc06e192ca4c8feb5b3cf3ba16a71852a863519f1b0358cc4c46841f8"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.44.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
