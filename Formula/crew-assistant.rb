class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.4/crew-assistant-darwin-arm64.tar.gz"
      sha256 "e95d8a10134ceb0188e67606a4c6ba44e5bbbede53280cd176ffed575c01d62f"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.4/crew-assistant-darwin-amd64.tar.gz"
      sha256 "2ff8778fe6d192e1f36747cec93d95664fea61d232893d3b16e0c9e62ff78937"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.4/crew-assistant-linux-arm64.tar.gz"
      sha256 "ccad682ae04c508571b7da71992b87dc635763258bd5f7a958f877e67f9b5df7"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.4/crew-assistant-linux-amd64.tar.gz"
      sha256 "d2f618ae9f9b3897b8c8ee76cf0cc4715ec50a15adb27e54da3c19fbb97e8d00"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.53.4", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
