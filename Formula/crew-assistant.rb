class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.54.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "e8fd422be088b13e402a60d99ab798dc89d379c0dc6e48c6d2a672cb8d386451"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.54.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "5d1841b82f5e45f17dfcaba0eb557fb6d908a2a8c8109c6099a464a4179515b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.54.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "aab7bcb1594848f441afd91ec27beb335c85b70e7f618fa63612fe72cfe76eb2"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.54.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "51ab17aba2837d371997c575d3dab58044d2cd65a960c69fa31268f9f57c48a1"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.54.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
