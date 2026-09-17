class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.10.0/agent-assistant-darwin-arm64.tar.gz"
      sha256 "eeb65950ce3bb7ee44c5cc675c433480ae7942857e6b5a4123241449ed721a18"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.10.0/agent-assistant-darwin-amd64.tar.gz"
      sha256 "230d13a824fbbb0afd75ead3ad18f95a205ed1da23c3348a015ef13140c9cc59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.10.0/agent-assistant-linux-arm64.tar.gz"
      sha256 "4dc1b8fa53e732bba86365a099fa1bd80e4d503865c57680c91e30dd654eac71"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.10.0/agent-assistant-linux-amd64.tar.gz"
      sha256 "d8b2f962bba02c68cb03a354c148b967b99eabbe3f42869294b6b363a5186974"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
