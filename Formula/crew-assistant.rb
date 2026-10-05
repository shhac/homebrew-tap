class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "1e0b250e25bcb70bca0247c9aa65707e08487bdeaa94b032dec4bc7dafed6cc0"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "4558274b2f72db204652871e3f2e96ad7cee2f8815cba308505c330aaa7abe05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "0d9f5e8aec21805ea57281003c26db6143599ee5babaaca17ffbc5e806278309"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "d83582a51f9c4c20d01dd4676ac5925eb43feb936d3b5379f7cce3c97040aa14"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.65.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
