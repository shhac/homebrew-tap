class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.2/crew-assistant-darwin-arm64.tar.gz"
      sha256 "c3609908726c1743ece18b942588fd8efb1b24e7a97c67b30d95a9236ea52207"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.2/crew-assistant-darwin-amd64.tar.gz"
      sha256 "e68854a7fd98791dc48d86c5f1a34ffc9573e0d73078da2eadee989ac69bde33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.2/crew-assistant-linux-arm64.tar.gz"
      sha256 "87a67a8a542fb28cac3c181fb1ff66db7a3a97de26e204856ad3ca4015a84223"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.2/crew-assistant-linux-amd64.tar.gz"
      sha256 "5327c9afcb06a11f6e956239b1684e02266c880139ae98d0f541c0cbbb5a1544"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.56.2", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
