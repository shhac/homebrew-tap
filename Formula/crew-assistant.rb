class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.52.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "dee8e16939605c4fa39c2a19d1f7d2700ea6674efecdb972df7c224dfa0f9e67"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.52.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "826a9589d193baa8c90ccc0cf2926be48f42898a0057dd128347bdd94b4af3da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.52.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "6e79c5728ba44dbcfad5a793e87a2765e3fb24c2e1f4bd44a669801e3eb09672"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.52.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "9a816fc4dfd3cb5be9b4629f8147b16598df301e1f6471cde33154d630f9815e"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.52.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
