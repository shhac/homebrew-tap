class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.26.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "40b6c6be55dc9d987c94407356cd5130dc4c293d6d53e00c1944f0d9f3118bf7"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.26.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "b386900d78316a2a24d2429a113e4bb9359aa2808938ca89b83b26e678771b26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.26.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "cf81a90fc43cc9750db3942c293f57a2c75afc28a60c84b706236a425b23ec93"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.26.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "5655831201976f7cd8cc04c7f7b7d8f0377a03b0ed2a475682a54e50ed52134f"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.26.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
