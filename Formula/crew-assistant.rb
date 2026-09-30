class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.33.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "6985cf31dde067d4ec58c79e5aa3dc5b2a6f4646a1d1cbae64c46444a8e8e378"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.33.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "766beda5d8318b050b26753acbad9e9b06699462d10b854537f04150f4026f9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.33.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "02d1b9f34c878f6d23db1ea53b4dd398685c3bd16caa029c863fbc90229c3e97"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.33.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "86e777b886af725e57cad54d2ceb906afe42d447fb36f182449ddefa3719d636"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.33.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
