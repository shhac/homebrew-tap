class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.13.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "ab282f3783dd4eaf52c8b7ac11760f94b0fe7a00980bb9f049f4596ad5dc5e27"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.13.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "407f7586b7391dbea6b14d53168d6d8b7a4f84163a98213768963b3b22ad7200"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.13.0/agent-dd-linux-arm64.tar.gz"
      sha256 "1da67b5672ce6e19125fa04471b9a7b414553218e4cbbff37238692f5966460f"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.13.0/agent-dd-linux-amd64.tar.gz"
      sha256 "835a6fc61723b8cc3c826d4b062630e05e92578a64fffad8ab535c7099ee62cf"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
