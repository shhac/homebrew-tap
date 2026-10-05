class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.6/crew-assistant-darwin-arm64.tar.gz"
      sha256 "9de7286a042e607cf8b49aab4941959f0550a3b226e5284bd6571c124777b87e"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.6/crew-assistant-darwin-amd64.tar.gz"
      sha256 "e52997b60b5436e1493dca8556631c59df58ec96e53519dd2da1b303751a67c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.6/crew-assistant-linux-arm64.tar.gz"
      sha256 "9e811c15efb9368e230eb3868bb7cbd4bf91a61853f30cc39cc45e99844ed76b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.6/crew-assistant-linux-amd64.tar.gz"
      sha256 "38e03a82927c69689c70eae650bcaf23346434c5d205539f27988a323520c8dd"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.65.6", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
