class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.3/crew-assistant-darwin-arm64.tar.gz"
      sha256 "13cb0b3ef2f7a524cf4ee1771770ce550eda4fd0874e90b7384922cad3abbbdd"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.3/crew-assistant-darwin-amd64.tar.gz"
      sha256 "a9f6f7461c2840f080e7296d4909d39ab466e99fd8f3e4a92c9c248a03b74857"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.3/crew-assistant-linux-arm64.tar.gz"
      sha256 "2a43b615eb425d1ea1f93099571298c009048c66150c87abfecae95a231d1fd5"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.3/crew-assistant-linux-amd64.tar.gz"
      sha256 "ac3f6b8fbfe574f0502193ecba537852136aa8de3d382a8cbe19e1879b9004a5"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.34.3", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
