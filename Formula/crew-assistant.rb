class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.62.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "dfb4a22812fb988f2813a8ba86c17a67499fcb03da4b9539e092dad7b9e7276d"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.62.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "e4185cd6a47d1616323e8ddba53102da04767352dc9174fab68f7e3f66bf0451"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.62.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "f3e6a40c72c99a3701e2247a6b1c1ea5f0752fa9b5db7cb70fea5c8a70650c3e"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.62.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "ee6c11a793eea30f327da0852907187aec7ab3c9ea53196fadcced3064182951"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.62.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
