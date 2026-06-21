class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.5.1/agent-postmark-darwin-arm64.tar.gz"
      sha256 "cf2afe413914b81c5a1fca15756ab983465ebed732785d950a208319064cf43b"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.5.1/agent-postmark-darwin-amd64.tar.gz"
      sha256 "aecb3053936574ac9f181118caca2a07ab0048f0fc176bc4eadca5297c0b7753"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.5.1/agent-postmark-linux-arm64.tar.gz"
      sha256 "fe7e989b12511353d417755cd695685273ae8a51f5868f4cab262a6708952159"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.5.1/agent-postmark-linux-amd64.tar.gz"
      sha256 "9c8201a2c74ef052f4adc07dd98554a2b886f5725d09aee96ea21b230b047e8e"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.5.1", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
