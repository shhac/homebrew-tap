class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.11.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "a57efb275d97aacbb5ea791dac9a542a5547d1f2a581633310cc4254e70cf001"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.11.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "4503ea5dded051ec226075c3514f9870b168d2852237927cdbdad307df7e25d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.11.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "5bcb8a00a6f2c3f5e3ef572a0bcb85f050a34f2670da6be593c7dacc987c94ac"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.11.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "0f5ede8855baa37fdbf8206e2280e1d12a3c4bbbee7405b748c835beb387782f"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
