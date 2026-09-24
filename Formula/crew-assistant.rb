class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.12.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "594df703d972bccadc16f9642ee52c0a16755c60a892bc915bb35f87ee335071"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.12.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "54be812878cb12456b231416ca48a38286814538cfbfc2535eaca5b1ea39e615"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.12.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "947a26ec63a31ed1118e71c9121c85e891e3aedbfc5d701833a6096ace8bbe66"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.12.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "5e65b392df8784bd238509d505665a92b819b02f25c05d34b7df56910c42e6fb"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
