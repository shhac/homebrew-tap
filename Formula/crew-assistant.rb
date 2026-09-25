class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.15.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "6dea949d0d03a107f0ad8275d503e8002d86ad7cc000f43ee43f139aa683cf74"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.15.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "1fc239b6a2475785f63b12d042e3a06e86f3eca10daa32e7b116b242e843205b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.15.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "917fd3e8dec0f749742c8f353d30c2014df8967b657dbfd837b0a21d9c13292e"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.15.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "c8c53315658ab5eeaa8926562965df6d9e2e03e4c248dd47521c35748de5a035"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
