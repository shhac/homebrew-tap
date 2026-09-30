class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.2/crew-assistant-darwin-arm64.tar.gz"
      sha256 "d4d68f9fe57cad3adfd94e00add4a60f99cdb5a1d5a1819446928cf39c01cae4"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.2/crew-assistant-darwin-amd64.tar.gz"
      sha256 "f9aa36a501a1b82e406102171843d379834dc646aaa79a0a68b61ef4c7cbcf5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.2/crew-assistant-linux-arm64.tar.gz"
      sha256 "112a29f3420f8c773609cc2ef0adb6872967f86abbdce3b49a8692e1ea35c923"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.2/crew-assistant-linux-amd64.tar.gz"
      sha256 "82f1cf55a89e7067157513520e79921523734ac15e2684d697998181d763d8bd"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.34.2", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
