class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.46.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "982300ea0cfc89d6422c5d8baf7fdf02087038bb43aee4c32797d553c133fc7e"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.46.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "c2301b57bd5c77280a3f3340fe03a2e83d46d1dea454a77e46a2a3e8b73d31f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.46.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "2dcfa947ab41905b0aef106229cda2e6b4f8c333d8a6a288edf5fdf67078bab4"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.46.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "a0c351d368c194718944baf8b16c6706742f767bc8a06ee52533b88717ffe3a3"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.46.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
