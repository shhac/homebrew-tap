class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.63.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "7f7ebffda0057dc17f846b280f12086222d6ac8154c9d6e5a91f7fcd2acd9164"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.63.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "fed71fdd8edb50af478740cc8c602a089135b3861962ea9ec7293f5448225306"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.63.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "3f31e5fa1b192858c39a3d5221a7a17d2b36cef4cb04b14f6aa9d537a2b84c4b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.63.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "2df6a8199679af45a42af35fb4d0e11c8641af2fe3b0de68fb236c5fbbdc467c"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.63.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
