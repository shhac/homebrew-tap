class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.20.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "b47c26aa6cfdac9ddd190f3c588063f62862c8efce16bab81f93ef996b8f3a6c"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.20.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "38b5141ef8a4bda99d19df55b7bf1f1378d0494520693e44d578eb678bb3059a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.20.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "5618f3b8b7f5db8c221a4ee9398c3ecf35f0484e9fd4013e55854b9f28c64b36"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.20.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "56e2f464cdb7828f386d644c236f3fec4d1b0e4625e8a795ab077b39d49567fa"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.20.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
