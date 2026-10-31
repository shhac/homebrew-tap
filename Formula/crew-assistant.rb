class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.67.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "bab42559b70ce6eddba823f3fe5625f45a73730e33c5cd0fee5c75191c6e242b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.67.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "69a318dc335e24592ad30b0b9046db08463ab5fdecc2bbedb7cc04051176a588"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.67.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "fe50f34c2c095326d4a4d16a912f25f246b3e17c078a154c1ad780bdadf7c322"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.67.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "4a81abd32f5fcba0d7d279bc4e8c0f2cb872f18ef5a916d0cf5aed2ba5f62662"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.67.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
