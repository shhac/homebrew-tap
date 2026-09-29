class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.31.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "8ec53fb1bfa4b42517dc5ff46c2598fbec648fc3a6e8d0b9089e210f694d5062"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.31.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "0978df1008363853b97031b530fdf6091cea5dffd0ecba64048d14563acad39d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.31.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "a50f8392b158c2350589c926ca773540603e2003a241c0c243e6250ad5568757"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.31.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "0e0ae6b1c50170067c67c6e260bb94548299f0e8ec48338afc66cf24c376a344"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.31.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
