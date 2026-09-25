class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.19.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "5a89e72b9962a9484df90064a0903692889ce6a19857cf3fd9cfdb04214af1c5"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.19.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "3a4537972f1117f8d972a619d577e1801d17dda9cb54d751ddda12bad360254a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.19.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "a28f26aebf8f8ac5c445978660954a53a24ca08d1d707fbdeb9f0e64448a4f91"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.19.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "2525348b773df35f6a13d23e4743ab0ac78f659124895379a0e435d0f2215181"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.19.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
