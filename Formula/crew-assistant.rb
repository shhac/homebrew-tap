class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.24.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "c6c3ced7051ec91c03da171f801c56e93163af851412cdc35bb012af5506e041"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.24.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "408cc70fa1a12e78ec4523ffcae89fa8a6c3c3337b4ae92eebec2ff5601be35f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.24.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "bf1c4e27fed2500eacd3d60cb5fea5cb05b0c8285885ded67fe2ac473caf496c"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.24.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "fce4685859a97f8fb13b1821e5665a16ae90aa0e8710ea43d333da5bae2c7d94"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.24.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
