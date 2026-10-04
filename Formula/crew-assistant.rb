class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.59.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "97548d265bda391d2795be53c238684185b163e68441d7d52ea6b605883a438b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.59.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "31bf39efcbf60f2c5e770ab15a5dc4676c562f10a1a5b8d0cd16c45892ee1a9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.59.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "850861a7e7a4cb4ea6d7ce521b436255060f7ba3212b6af0d11127860c8e0299"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.59.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "baae06c7b340134b28b7db167bf29c360eb917f2f08f0e6a220a16f89b6e2fa8"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.59.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
