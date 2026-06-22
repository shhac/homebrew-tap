class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.11.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "d57a749ed7a9aad097d08ae87f61ed91da8762e6f58369a84a0f205981e39b60"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.11.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "4beb39cace8fb32608c4144c7cb85205b0c3a3b1ef212d0cee2e9a860b7d3408"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.11.0/agent-dd-linux-arm64.tar.gz"
      sha256 "06f8543c51c2cfe481820ed67e196f0ca9812290cea5389b50e8adbceeaed44b"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.11.0/agent-dd-linux-amd64.tar.gz"
      sha256 "615dc75c55966e95c1414f84a29aeb1d0c786c8b4d19c8cb2243ef8b8a72ef58"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
