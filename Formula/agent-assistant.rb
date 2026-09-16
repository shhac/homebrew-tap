class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.8.0/agent-assistant-darwin-arm64.tar.gz"
      sha256 "be107d572b1c562b44853be09eabf9c04bdfb8d46056cd629c2511e71f63a06a"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.8.0/agent-assistant-darwin-amd64.tar.gz"
      sha256 "d4e2acf5f7cb60f7e0e852690783bbac4ca31cfb4c9c218fbc695722428aa700"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.8.0/agent-assistant-linux-arm64.tar.gz"
      sha256 "a458f3adacd32142776fcaeedf225bc790eb107c6fdbdfc31250e3954805c467"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.8.0/agent-assistant-linux-amd64.tar.gz"
      sha256 "fd0d5688b0ab44b1d6f7869b10c738ada94aaf1dfe0ccc7eecfecc80c09443fd"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
