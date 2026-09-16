class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.5.0/agent-assistant-darwin-arm64.tar.gz"
      sha256 "a8c31259e1c36c7f86ac8a82a90e3778cae1cad60525dbaef608422c7a0a2f2a"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.5.0/agent-assistant-darwin-amd64.tar.gz"
      sha256 "df16e80712b76aa5229f7f0e3e351b01bddc44d64a71d7f5373a84354d5fb312"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.5.0/agent-assistant-linux-arm64.tar.gz"
      sha256 "f21ee00b6a99d67f061492855e87dc7e6ff3a354f6009085140b5466d02e5ff6"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.5.0/agent-assistant-linux-amd64.tar.gz"
      sha256 "225ac6e1e04fee88f3556a51db1134e05a73bdd9421591116255937455647134"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
