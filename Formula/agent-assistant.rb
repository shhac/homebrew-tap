class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.2.0/agent-assistant-darwin-arm64.tar.gz"
      sha256 "ec07d50720a14acfccd339d58ff9f2e6817f1df2ef77fa3e809b7ff9d36074c3"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.2.0/agent-assistant-darwin-amd64.tar.gz"
      sha256 "3108cc558de18f68cb492f8de7ba221d10ea1f3d972c66141aba64709fe613dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.2.0/agent-assistant-linux-arm64.tar.gz"
      sha256 "2dad21c100af46f9892b6e1dede1b4f7f59f032f69ef6dcd534d9a8f803a2a53"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.2.0/agent-assistant-linux-amd64.tar.gz"
      sha256 "f1ad68b0c88be55c147e3629aed45159cbc95de18bd4c0131f55fe99a17dee42"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
