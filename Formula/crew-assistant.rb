class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.69.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "39411e21f25ede3f53e8941ca831f72684dff821d9dd16616b9f81e3d462803f"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.69.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "c57be43cc5e452598ebb7403983d2354fc41f6f78a4a62c654a04f9ed03a00ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.69.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "10836b3e30bec95a7dbd5332f353a8f8b29db02352d6ac7ea57fbc54652ce5ab"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.69.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "d8b8049460fb70d8442e674de6b45b42520405519aa9f80bf9f7494f96281730"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.69.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
