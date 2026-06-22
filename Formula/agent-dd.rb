class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.16.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "5ff17aed95fafcab51e4b7500d04e49fb50e6a5170910361ad39a2730d16bcf1"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.16.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "96f2818c96bbd19ff9ad12e994e2754fbc36844ed9c071a8efdd2493960eae79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.16.0/agent-dd-linux-arm64.tar.gz"
      sha256 "2e88c1fde835cf996188ba8c5930eb107f4b05dad67295e1de263615599e7e4d"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.16.0/agent-dd-linux-amd64.tar.gz"
      sha256 "7a9ea9c80e3ee701d26ffeb5f30b52cd4ce28653c476257b6852111877d4e083"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
