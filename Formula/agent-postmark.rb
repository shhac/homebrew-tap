class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.12.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "a2fa0645b4cb80b4c5c5b45ffcd710c9e007cb8d014824abba73dcfa9b13eadd"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.12.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "2106c0cc4eac1627aa6022bc72895aee67bea94ef75f10657a4673b512696e5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.12.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "0650f5a0a6890ec78db700839b9d80d4861e32ed96a338edf0e4b27cc28200b9"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.12.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "05df70a0344c5873a64588eb2d35e9b5c17c83d8fcab4f65b55d967653d5aa47"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
