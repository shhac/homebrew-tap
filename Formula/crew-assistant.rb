class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.4/crew-assistant-darwin-arm64.tar.gz"
      sha256 "0945c39f78c593a5af5d058615a060d1c30c961e266ba5afc18ce94822031a5c"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.4/crew-assistant-darwin-amd64.tar.gz"
      sha256 "570736498ea332fa7a7c7cc33167b850a16ab7d5d29b186a535cc9b108c66a1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.4/crew-assistant-linux-arm64.tar.gz"
      sha256 "a0a38a42ac0d9b40855a02ceaf041ce2e3a5786dec3aafbb393c1405e1956dea"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.4/crew-assistant-linux-amd64.tar.gz"
      sha256 "5ea50d4f78d9232daa61734a2f09488f05542d0b46ff302afaadb15a49eb4c3f"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.56.4", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
