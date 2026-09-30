class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.36.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "a412b0f2b8910bdb056cd2b323f2212ee3a34618026b43b91250f5e9d1c666bf"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.36.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "aee421862663709c6021940ad54b75083608c344f76dd54bde7d2b407c4dcbdc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.36.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "f84bff0a37e08e7476e6c36cf0ea62fec80e48b1683908050bee1511f502ec57"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.36.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "4046a6bbe2b25a6012723e7ef9a4bac1a4410a4cd33e74e4f8e6483147d52c99"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.36.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
