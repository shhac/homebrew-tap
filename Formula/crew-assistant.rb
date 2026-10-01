class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.44.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "c45a8eae29d4d8568abd58f74c547f8044b0fae3dfe109c23fb9065aeadac138"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.44.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "18f7ce1b43613dda359f2f93d5e9ecca50672018685c240efb1a0fdde4fa30a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.44.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "165c1e4fde9dbdcc25a8e541c67c2e808ed87ea99518fce9be4e6cc939c42e18"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.44.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "f005849b1ebd37bb08b5536007ba6341465affaf60a99ac9f0d4a73eae36f7b0"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.44.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
