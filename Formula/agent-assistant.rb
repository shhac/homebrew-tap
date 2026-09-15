class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  version "0.1.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.1.0/agent-assistant-darwin-arm64.tar.gz"
      sha256 "43fc5c7e41f131bafb9cfb76c4d9c3631867bf99fe9bfc579ad2c84ebf731adc"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.1.0/agent-assistant-darwin-amd64.tar.gz"
      sha256 "986072e21e7d73c1a6e63c6dc6136b4915ab22c708e56a7e685671f69b61898c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.1.0/agent-assistant-linux-arm64.tar.gz"
      sha256 "f68b2f11b6d9dc0bbbac793c159558f18b0cd1531d7e24dcfb7d0ea9a5447448"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.1.0/agent-assistant-linux-amd64.tar.gz"
      sha256 "2c29cc1c362656a1be7f181174b495bdfbdab1921ef78e148f5d61cafbf4dbcc"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
