class AgentAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/agent-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.7.0/agent-assistant-darwin-arm64.tar.gz"
      sha256 "df39ae9f1e844542c4b967f70a2ced7c450db3e9dceff760bba38ca0faae0087"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.7.0/agent-assistant-darwin-amd64.tar.gz"
      sha256 "57738dff9c0f9859023bb0e47c097e09aef7e6df86a51121ea99d8b7660f65ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.7.0/agent-assistant-linux-arm64.tar.gz"
      sha256 "9037cd98d90fa617ada379561527948595df2c0b25e600f71e4d901b62eb43bd"
    end
    on_intel do
      url "https://github.com/shhac/agent-assistant/releases/download/v0.7.0/agent-assistant-linux-amd64.tar.gz"
      sha256 "a1b2f8c8870715ea14b613a80fbd6ed2586aee376961c1408b9bafb6dfec7715"
    end
  end

  def install
    bin.install "agent-assistant"
    # Installs shell completions via `agent-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-assistant", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/agent-assistant --help")
    assert_match "#compdef agent-assistant", shell_output("#{bin}/agent-assistant completion zsh")
  end
end
