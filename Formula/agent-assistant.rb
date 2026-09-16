class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.4.0/agent-assistant-darwin-arm64.tar.gz"
      sha256 "c6f73fee045ced0e2596cfa727917a750e3099c9dc6a6d761190a8ccc15c9d79"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.4.0/agent-assistant-darwin-amd64.tar.gz"
      sha256 "3507a2ee4bc4468b86ccb291a82f1b46bc4270760f61fb45224d6434435c89e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.4.0/agent-assistant-linux-arm64.tar.gz"
      sha256 "f67b7bc22555d88529c21725cf1c0398ac7d13f9e2f4fdeabb696235dc1744ef"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.4.0/agent-assistant-linux-amd64.tar.gz"
      sha256 "9c9f27f37a875d3eeca20d5e76b217733e1d686bf4e4cc8f0ddde00be375ab9a"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
