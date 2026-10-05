class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.9/crew-assistant-darwin-arm64.tar.gz"
      sha256 "9e5374fd1dcb83b82957cd9b0329134cebc9b9c74e4549670d509c2e5949eedf"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.9/crew-assistant-darwin-amd64.tar.gz"
      sha256 "b2e8afa89d2217d1facd7e3dafc0e37db866d9352d5755bda3e2b331b91bb427"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.9/crew-assistant-linux-arm64.tar.gz"
      sha256 "93c9f45d72edcde67ffb6e2554207ac96711c63326bab5b3f87fc256bb72bc37"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.9/crew-assistant-linux-amd64.tar.gz"
      sha256 "7466a69a57e6c27276c65b7d96cedd9d6240c259714c64ee305337bcd27879b3"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.65.9", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
