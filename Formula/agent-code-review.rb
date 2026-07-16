class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.18.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.2/agent-code-review-darwin-arm64.tar.gz"
      sha256 "ecedd7c39897c8cfbde29abbf73dde7a5689caa80f77759b1da10b1bd225f6fe"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.2/agent-code-review-darwin-amd64.tar.gz"
      sha256 "3989626a9ca9a2bdf2d45f1b2beb79ae117d20e9324fb39e634f72847f463980"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.2/agent-code-review-linux-arm64.tar.gz"
      sha256 "ee96b9052a565a3ac00b226b25389bd4d5eaf979b76841a0acbf147e424f6b68"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.2/agent-code-review-linux-amd64.tar.gz"
      sha256 "f8de8846484eae9b4e57e6fdded60444deed3f1dc83b23a3dca8fc7bf1b50e4a"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.18.2", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
