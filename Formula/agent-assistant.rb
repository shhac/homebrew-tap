class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.6.0/agent-assistant-darwin-arm64.tar.gz"
      sha256 "f97ba5ac2830060bd68192d3182003cffdb16d28914b3ae993ad79989d1e2135"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.6.0/agent-assistant-darwin-amd64.tar.gz"
      sha256 "9f781fef6ee370d3cb847b753309de6aa9ea8bea3e092c4ead56f277e5c427ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.6.0/agent-assistant-linux-arm64.tar.gz"
      sha256 "258eef5031e3e1f817e099780c430f4dd886216c0424ce61c25ced554f4e8efb"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.6.0/agent-assistant-linux-amd64.tar.gz"
      sha256 "b8237a25b48d893100ecced1645189b528c0f50bb4703cef463f1212ccb7e437"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
