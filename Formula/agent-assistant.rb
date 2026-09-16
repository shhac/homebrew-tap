class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.3.0/agent-assistant-darwin-arm64.tar.gz"
      sha256 "f8aef7108d21e09fc44fb27f104d45fcdc83e843376df2839ffa000432401c81"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.3.0/agent-assistant-darwin-amd64.tar.gz"
      sha256 "be5c8fa84e768522f15a9a9ed88a5b790f238c18de2c389e651db6a1e7ba3fc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.3.0/agent-assistant-linux-arm64.tar.gz"
      sha256 "9c00229d0fe3ccb23261c312d001311c688a7d144b5e42b8b033e3082d262612"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.3.0/agent-assistant-linux-amd64.tar.gz"
      sha256 "81ab97e1e207a736bea1c57b5cd571483a6d830f3ad4b58dc22b6de587687118"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
