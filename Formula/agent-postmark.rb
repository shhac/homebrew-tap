class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.13.1/agent-postmark-darwin-arm64.tar.gz"
      sha256 "d841ebb58aac0cae2b1c31d6bb37e194d8ef7964d35e726362930379ec978567"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.13.1/agent-postmark-darwin-amd64.tar.gz"
      sha256 "ac76f74ea4152b0e5578cfa4fa6f17a4a76a7c0d6fd20124672c53d116ff3a4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.13.1/agent-postmark-linux-arm64.tar.gz"
      sha256 "e36981c9202afff7a7417ac5f576b2551b529f36e3e5f5074e6b2eb5ee868971"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.13.1/agent-postmark-linux-amd64.tar.gz"
      sha256 "3fd3b0d7a589cfbf1fcac8244648a622f12eb91248b23ac8a27c577b76e145ae"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.13.1", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
