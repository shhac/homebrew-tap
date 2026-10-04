class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.3/crew-assistant-darwin-arm64.tar.gz"
      sha256 "a2459f606f833361f99377378398c6fd549059cef66ffcd0594e7c808d19721b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.3/crew-assistant-darwin-amd64.tar.gz"
      sha256 "8838407398bb7b6aedf63d8fe0545af30449674f383542eabd0b497f359b0467"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.3/crew-assistant-linux-arm64.tar.gz"
      sha256 "3cb6e92e812ad91926fa27f156c833101dc68e80e63908fc7477ade868358c3b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.3/crew-assistant-linux-amd64.tar.gz"
      sha256 "36bc581a83fa8e2b0c855a85088921316053f14447cdd6b7cc45571901424b6b"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.53.3", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
