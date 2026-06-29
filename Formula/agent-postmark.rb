class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.16.1/agent-postmark-darwin-arm64.tar.gz"
      sha256 "30f8509cca543c5d22e5ea8478221a4e30eaeda485956edbb3c9dd40f322b3bc"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.16.1/agent-postmark-darwin-amd64.tar.gz"
      sha256 "56c9629edb4738cc840c79179d6a2b7e3daf44d61b432c3d54dc88d409220487"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.16.1/agent-postmark-linux-arm64.tar.gz"
      sha256 "40625523dd4cdfd289b165619e6802470f80eae5d822c465da16663f3990d6e4"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.16.1/agent-postmark-linux-amd64.tar.gz"
      sha256 "ae2c1d7a43d110a05ad6be7c16ab1f5da795c253a014923e2bf86d9c097a3202"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.16.1", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
