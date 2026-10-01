class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.43.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "27fd6998d57616c53bc758ab953f95b0b5ec385f0be244d94c11f67a6b53b151"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.43.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "82e7692b9c8780c9940e15106979a13a7fc5c4a7a3412e9a873297be99ab53b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.43.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "473550196f44a443e95f8d6f2e31f57959c02eb9c20cb3460b69b84df720d3b9"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.43.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "3379efcf17128063c3814981e6dac5f137c0b5c69bdaaedd47c25b73e423bfde"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.43.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
