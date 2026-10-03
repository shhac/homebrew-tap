class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "f2e0d573debd7371d62a36b2f2bacd69db717b7c101424a64da199c7f7f33694"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "6210faa92da476e6b9d0555fc61086a717fb77a43caa3ae22d69605e2e091aa4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "65afbdd40f3e851e442a8f204d3bf8d48f47347f969092ec972847cd3fbb61e8"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "23e8ec5533363ef3967f0f1585c73810313ba3cdbbb420ef9dbffa192d1f5f61"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.53.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
