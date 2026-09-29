class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.28.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "030df5b4a084b4706fb73b0ed3af0ad2b101ba372da952fa2c2992a3b12c991b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.28.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "1e87ff50f5da2f488f54786a248752872d13a8ad7c124870e41d6354cedcf657"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.28.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "91ab13b22bb95e2ebab814e4d944032e11ba272f9cdefc83011be9c8057216f5"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.28.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "ef5ed1cab573cbfca07b342ea1f3944ad144ae9a874006e2f9dc64fc66dc55a4"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.28.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
