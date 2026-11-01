class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.71.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "ee349a030330f131809c460d456975e8e403197f67a2451f80f01f0b19afea42"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.71.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "cc97ebed2cdb1bff0393c436a21af68a73bed6cf8d764130d00df0b2af47cfbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.71.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "e47d4e4008391f4c0a0c665c4ef9f88f43143d509b655e5f9c648fcaa37df059"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.71.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "3d2fb7282caf9b805b476205b90f1d5cbf5bd29c1ee1640162a3fb2326bba57c"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.71.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
