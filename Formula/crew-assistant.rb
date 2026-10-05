class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.7/crew-assistant-darwin-arm64.tar.gz"
      sha256 "06f07ac7699d12c574e893c3f0872421d8bc49c43a366ad0f35ab07f23aa0e27"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.7/crew-assistant-darwin-amd64.tar.gz"
      sha256 "f361bd71534c6a4903ba08028fc7b58334be5c2244e530c8163e915671ee3c7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.7/crew-assistant-linux-arm64.tar.gz"
      sha256 "669c800e97d6d5e92d4c6ac053042da7e49a7b069dfa6abc080d901748093946"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.7/crew-assistant-linux-amd64.tar.gz"
      sha256 "02bcb710262e581ba1805ffbc062126807b9c2b5bd8c1d1b830e8a6ec84cd03f"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.65.7", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
