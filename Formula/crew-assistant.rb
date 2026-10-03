class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.51.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "15d2927e4ad5f312aacf5a443e1bcdbd48ebbd7e54054e9808820f7b6f435e56"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.51.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "97ca8eff5a37c13309b09db40374971f4b530d637bf1cd269650136c2a839f3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.51.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "bba278711de8fc3fda53ddc53582937cb4e0d31589b1ac946487aa29c8c03992"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.51.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "1fde177238eddd04a9c088ac4fc62b62c57d31254b88d4efb0f66c1b83e27044"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.51.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
