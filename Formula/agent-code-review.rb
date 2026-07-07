class AgentCodeReview < Formula
  desc "PR review queue + scheduler for AI agents"
  homepage "https://github.com/shhac/agent-code-review"
  version "0.1.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.1.0/agent-code-review-darwin-arm64.tar.gz"
      sha256 "474f65f48f097ee8c3e3ef6b1570ab4ff0f105520f51ce70d48aa20f829922c5"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.1.0/agent-code-review-darwin-amd64.tar.gz"
      sha256 "9bb2786083b65cee4987bae15d375767e2e195117f7f70311df745888a4b4ca4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.1.0/agent-code-review-linux-arm64.tar.gz"
      sha256 "bd5a45ced54939e1737e1324bd9c19619aa22868eceafefa1d0d062154ca6d29"
    end
    on_intel do
      url "https://github.com/shhac/agent-code-review/releases/download/v0.1.0/agent-code-review-linux-amd64.tar.gz"
      sha256 "7cc968f9085dd3e0eba653fb2155b6627eea94bd14c6f6397d2301bcb27f39b2"
    end
  end

  def install
    bin.install "agent-code-review"
    # Installs shell completions via `agent-code-review completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-code-review", "completion")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-code-review --version")
    assert_match "PR review queue", shell_output("#{bin}/agent-code-review --help")
    assert_match "#compdef agent-code-review", shell_output("#{bin}/agent-code-review completion zsh")
  end
end
