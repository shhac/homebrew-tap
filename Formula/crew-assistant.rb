class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.32.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "2dbe86647e79bebc2d9542623c81a1ed7f97e397b44bfd1ee9964ec388739427"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.32.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "e286167ac87f952732ceb5542f52a0b357bf8ac046782b7fd00feee4847cc82d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.32.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "1ed86cc755a8bd95fb449e14cab96b5e1c0b14ed1d8bfb2d3d797ba034226890"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.32.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "0399393d0211893f8b7a3bd8fda6471ea25ed101fa85dbd6928556644ca733e5"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.32.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
