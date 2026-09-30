class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.37.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "39f2079f442d856db346e8b583f0c8e840b482d7c33cf4b6e1e4a4e47f2bfbe2"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.37.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "c5e9a656f392589f46571fa735a558ef548efbfb23d8cad58747581205b5d353"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.37.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "6106aecd3592045db0789c219b13885adfdd2b82fcca4b43e4d98fd8b375c97e"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.37.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "0e1fb9622518c7bd917f3204fafa47a3762dd9243081325ceee3043773656665"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.37.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
