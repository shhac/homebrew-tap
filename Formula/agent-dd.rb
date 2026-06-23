class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.16.1/agent-dd-darwin-arm64.tar.gz"
      sha256 "940e435a4093672274ea67dc4ca43196f68cccf4719fdb7081ce14e5e5bbf8a8"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.16.1/agent-dd-darwin-amd64.tar.gz"
      sha256 "109abcb8456091a7b6a66f0a325f26be6878f2f44128f1474d210fe90339af26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.16.1/agent-dd-linux-arm64.tar.gz"
      sha256 "960ee20894ba12eb5c4bd11ac689eb64aaf5116e09d83a4deb05a19fb84f9b1e"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.16.1/agent-dd-linux-amd64.tar.gz"
      sha256 "2ddac0cfead62e9a643c9264f5c88b973a25e4c3eba5ccedaa68efe0b409e3a3"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.16.1", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
