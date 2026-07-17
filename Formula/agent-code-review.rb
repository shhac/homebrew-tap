class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.21.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.21.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "590e095ebea2883018e381c5cfda2d804b17e22dcebcaeb640da6aa51e079570"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.21.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "88d3528a51391c4b741b42bbf44f18cb72a759464d37aba93a3973237147c0af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.21.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "b2f0e9fc5ad56186010f0dcedf7bac4c662fcba27730fab842625aaf2dbc83e3"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.21.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "29857598c2c90c5d7e7f81052428d463862597a65701bf1b1d56a66ef82206e1"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.21.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
