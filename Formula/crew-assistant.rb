class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.35.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "add92ea1f647f1067fcfa3c109ce95d76d5ce2492f296fd98c5d1ed25639de0e"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.35.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "efdee15caef647a6331028b042369a9abae04b98bc5f4c836b67cd29b8e99c51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.35.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "8f40ea08f172a046548ccb30556e3dcd8f332069a94899e4ed23b9aea8022a30"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.35.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "4a66dd619473de01ade269c6d1483bc6926a6c59750af2815ec1a2d6fe00675a"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.35.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
