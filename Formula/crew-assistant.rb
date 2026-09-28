class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.28.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "3f58acaa51a2ecccd87046159f159fa53b76ec8948570a292ef2b99ad98452ea"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.28.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "30d0ffad1b6604433eb115b10e143e44f1242ec4c71b4a8a1cbb418fdae72cd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.28.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "ba3b6b9008a49040458ebd86d39952c9686ca311d52120ef31719f1372192f5b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.28.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "febb492f5aa3b06ef501649a6da1dccdb23d9478e4deb00fd92785a7ebdcaa01"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.28.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
