class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.2/crew-assistant-darwin-arm64.tar.gz"
      sha256 "ed2d81c226e999a8d8db30a8ec90244e2c3b82bbf2ce9bf66998f95d2e12cd05"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.2/crew-assistant-darwin-amd64.tar.gz"
      sha256 "b2aa224235df0eda10f229279ab378af3de787ec78f17a30575c5b2bb2208991"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.2/crew-assistant-linux-arm64.tar.gz"
      sha256 "3cb8d32e910ef8d90360fcecb95ff00c205b766fc56d39baa57f42994b95a0ac"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.2/crew-assistant-linux-amd64.tar.gz"
      sha256 "19af8d7e8b29e453df7eb9476430be6696f26fe0d83133e2d0b9b8b735a1b697"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.65.2", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
