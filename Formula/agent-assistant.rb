class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.2.1/agent-assistant-darwin-arm64.tar.gz"
      sha256 "02579c23a1b839d39bebeb4f3210d81f0eac3ab5da15ca4b9117b89e5965b5af"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.2.1/agent-assistant-darwin-amd64.tar.gz"
      sha256 "2cd1b9a5f9ee1a9c5a346e6fb2cdbdc184f33d6286d0057cce325e2d86fc9b9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.2.1/agent-assistant-linux-arm64.tar.gz"
      sha256 "da0509645e170f7d4b3e2965d9e6ac9b481c6d32df81cc5f087acb65ea380b00"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.2.1/agent-assistant-linux-amd64.tar.gz"
      sha256 "fb3c32aa82f33cc466bbed94bb7680c8d46d9bfffc52d7b2613f7f12cd1e1587"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
