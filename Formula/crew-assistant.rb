class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "59c2945ca4cd241d1f6efd0f46d7bdb6d8ca17a0de62d0b12b68aefc4500b308"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "c3281160fea3af58d407365d478aedf5bd5178701457c5a9927d8e164844f4c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "17e25168037bd3cef5701b84b2706ba1d9fbc576a6db7af59fc300af2ad0ac95"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "b1b855cbc911c7ec130304a8b90521943a423d5d4af1405df9edd4d1c1bdfc05"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.65.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
