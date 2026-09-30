class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.38.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "1eccd93fec25a0545bf18293bd10306c5b4b2e74451aa2ebd766da0f36645571"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.38.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "d3c63760e0db5f97f599b8d152787debd968f0ec2284c0e9751d88f9560adc3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.38.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "d6e88fcf66d2844888881126d9c15921f6d2c4ab17eefa1af889a16f83426958"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.38.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "d1613506b692437a07cfee8738d53c8c9133af3704e5ede9e152ac677239537a"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.38.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
