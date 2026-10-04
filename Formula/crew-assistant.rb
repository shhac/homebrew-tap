class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.3/crew-assistant-darwin-arm64.tar.gz"
      sha256 "25f788effdab96b9bdfd1a00684ccadc2fa6429b093441a961a5c9ff50a339a1"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.3/crew-assistant-darwin-amd64.tar.gz"
      sha256 "f597941eff58f4e79a285beaa315dc02b101022e8d2e9740428e2403664586b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.3/crew-assistant-linux-arm64.tar.gz"
      sha256 "c016ac25335a92c84ec16c1127095c2a03245fa23e914fd66ee8e3b097799327"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.3/crew-assistant-linux-amd64.tar.gz"
      sha256 "4c97bb68393a8605ab54bcb19e7ec98f8496b7d0727174d2ca10e106d3cd22dd"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.56.3", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
