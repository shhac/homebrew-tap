class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.8/crew-assistant-darwin-arm64.tar.gz"
      sha256 "b014651f9f878ed164c8fcea8f25d3cb1c0a35a28595b23b02552019476fa156"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.8/crew-assistant-darwin-amd64.tar.gz"
      sha256 "e909d98833372c601024bf6e00f4a0d7670862be1c8a353b1bbdf6a9e0841c23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.8/crew-assistant-linux-arm64.tar.gz"
      sha256 "0c198d92caf8f3212d8c7fed46cfe0160d711b2807e7ea72c7de7b040969b59f"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.8/crew-assistant-linux-amd64.tar.gz"
      sha256 "0121597118f01906bee840eb48cb7ff3360f93f0f725c6dd77b9cb6e9410caad"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.56.8", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
