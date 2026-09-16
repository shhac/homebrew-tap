class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.9.0/agent-assistant-darwin-arm64.tar.gz"
      sha256 "35b99fc60b8c0d00392021abd53f32ae4fedb0260d18c205b86088dc01f434ff"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.9.0/agent-assistant-darwin-amd64.tar.gz"
      sha256 "089306d3006924a77f94e0123c19653910bc8d6021b44aa0c215bf8c4196e6f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.9.0/agent-assistant-linux-arm64.tar.gz"
      sha256 "df69ebf69a84f79c8e76c14fc58253ef60cce7288aa14f9f8f7a3d555e69e5bd"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.9.0/agent-assistant-linux-amd64.tar.gz"
      sha256 "edf5f03bb43fec54f1c0e653ab77101defe0460c1f5abeebfaa3eb31ac207052"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
