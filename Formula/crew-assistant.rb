class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.72.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "95460e548cc137be9c56aeab6137c5f8b74ff16f03c95745a34b7162d5ccfb19"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.72.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "7a7790a798ee16cd529e3ba5dda4487ba7696c54cd7b43d0899c654f5a0d5dad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.72.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "17c58070691c1e4d5276b1f4a2ce66ecf1ede5b467baacaaed061b76bb4bbb0b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.72.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "1985aeaf6b04eb1e38be55d301c8877ab7bd6f1348954eff9a745a790906b5d4"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.72.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
