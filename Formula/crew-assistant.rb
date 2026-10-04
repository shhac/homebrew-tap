class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.60.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "ef7b8d562ed606466257d1c58a19aed2b7f075b505d5d9032dbc63ab54654415"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.60.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "b25844074439f7a53cb34940ae6d5b8f9eeb8191a95bf411096200dcab40f8e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.60.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "95d804bbd2ce5dfdef09f08bd00ce197e6d8d2652796f0ba8246085b1211433a"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.60.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "fff40662e6f94ebfe530308056b16a7f84e05fada3f0fe4a57765515abceaf85"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.60.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
