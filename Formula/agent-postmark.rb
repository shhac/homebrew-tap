class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.16.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "4f86b296763c1325a77fb3617b22b98e405d7db5a7e3a3749dd6754e88611f36"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.16.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "98eb91bc41c9c4c4564c5646d9ee6ad5c323be615d3c65b4940024a1d89fd734"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.16.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "9e9c9982e6918a913fea597d10a1c8bf823b71611a83415cdda4893908b0b7c2"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.16.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "e791e3592e287d9ea47c3057633cf7f5c47a7e2a760cc578e45da09980572bf8"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
