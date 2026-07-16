class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.18.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "2f4da5f8e8c45d6f39dd6a6622c3adb955790eac47fae96cc32dcfff41de7e93"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "65f618f5b15ec2ecee4ae390f4bda7f728c38dd58d8b3c1e387dbad100137b86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "adc5a9781808130341b736fc9e17f4fef18363ab0be3fc2b7e80b40143cc4de5"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.18.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "6ec1e21021861cc15e98b0c425fdafeeff3c87d6645709e1b44689d470e63eb2"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.18.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
