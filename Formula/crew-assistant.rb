class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.18.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "19bbe051b7670a90217427cba231f0327145b8533eef50331dcd9d550ccf0b68"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.18.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "c1b2e6ce72045230f72063b82029f9a3cef33a70accaef972942fd808196d061"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.18.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "3d5a9b203e5ecc57dfec9acf72564c7b31882aa1a96bc7bec953a6c4dd2f5b98"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.18.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "d707dbf7b278f365c53365d1ca8294b41b781be83de931fbc66359fcfd140dde"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.18.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
