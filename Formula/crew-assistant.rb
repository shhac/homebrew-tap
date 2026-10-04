class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.6/crew-assistant-darwin-arm64.tar.gz"
      sha256 "bd30ee87e19ca2a5824d428e51bf303400ea02985d657ea01955ed64581c5159"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.6/crew-assistant-darwin-amd64.tar.gz"
      sha256 "2db7a381763333fcf1f52e06a141de8a3d50c5bd711c350abf5e5faaf65f4de3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.6/crew-assistant-linux-arm64.tar.gz"
      sha256 "a83b5f9f0614df98b05560287cdaa5557b5254575dd5db6467a800257118a7f7"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.6/crew-assistant-linux-amd64.tar.gz"
      sha256 "62bed2bcfaab6d96f1235710f339f254cd0fdf23935bd8b1360d9f1029d489cc"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.56.6", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
