class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.15.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "3a8a7c5ab63382f02271107648ebf5e0b447be0112566e10533e2103057b4b95"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.15.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "0df2880758defc32cfcb6ec27d785869e2db5e77649e37c4058bd451f5e1bd6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.15.0/agent-dd-linux-arm64.tar.gz"
      sha256 "3af881e62bd2d3f88d002d5ce1f9a38d03b998fe0156871c7c4de9b93406b725"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.15.0/agent-dd-linux-amd64.tar.gz"
      sha256 "9345daaaddde8a4675b3b6196b32d75cc88d0d69b81f1972853796bf5f1b914a"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
