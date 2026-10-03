class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.50.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "2d38ed330af6aa7b194439419630096dba91f718fbd58633c4536ca00b06fc18"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.50.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "14a9eb2a7e1da715eafa394be94ce5b751e9586faaaf5d991ce4260619c9c532"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.50.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "56162accb7c66cf4d369c23828821419b0fdb3e36088b22e1266e87eea0c695f"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.50.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "f2f5f8e46debad297463f57bbaee65f35eb575e7eb7ea90fb59138ecddc5c195"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.50.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
