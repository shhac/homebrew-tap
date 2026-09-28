class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.23.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "e4d94817f9499780e7adb89677317d1b311a8c44bceb00349d3433c7cad1520c"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.23.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "b11d93261e9fa1a0184d6df5c02ecf802a2f16267adfdf7d16bccf22c02295c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.23.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "0e2931bc95640f9958a7f29665fec12655ef41248e86baa319a6198814a37bc6"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.23.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "8af76c12199f62a3be2f2d12e10319e3f6ae8ba69d1d1dfe6f0078ff85e15528"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.23.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
