class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.29.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "0aeb35d5d9ddd60f2963f9b727f8a2ff73992237967b224b0a22acc71bdce16f"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.29.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "1b7fdc96fff66285542069d0bf61ec6afb67519d0118227cdd501bfdf9bbe777"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.29.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "481cff258b3db8f1105b4ee34061ebe0d156b764a166ea471f08900e0312edb7"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.29.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "d57c701385da5fcbb14edb76d06868b12af9857c2dc7180f9bd797b0ebc8ddcb"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.29.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
