class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.5.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "82b32a767b9ccdfd61d0f699b10f35826d2c31d4d14bbe13dc5b0f626adc534d"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.5.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "7796084ee4087df0e7657d0f02805e3794be5fb8c886e7e0c81c8feb46d50a80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.5.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "748e0c4ee3a13cbc9202675c0f1611da4135e93d1a3a56fdf1dc8b7f31529174"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.5.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "ac15f326cd12c4f768a543eff4917de456cfc4654b8ab5bb1fb27977f6060f96"
    end
  end

  def install
    bin.install Dir["agent-postmark-*"].first => "agent-postmark"
    # Runs `agent-postmark completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "agent-postmark", shell_output("#{bin}/agent-postmark usage")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-postmark completion bash")
  end
end
