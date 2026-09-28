class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.27.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "38f1e783c12eaa96f841a26797f25d2febbdbf6c2e6d44a5ece17ec3c3425b57"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.27.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "ae714f41764c45d00082dbafbdaca86c942ae4624e93c1741ed9004ab7608644"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.27.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "248b0b0180c5c7be44d28728ec4388e364ddde393a8de9de9ff3b91d39d1383d"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.27.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "059edebf446223b6496afe5ecf60d2b804ac1a85c95160ca7a94f25164314aa4"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.27.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
