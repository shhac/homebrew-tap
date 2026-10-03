class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "3665385761388a78186bfc5263315c6924922b5e8989756cff04fb0e7f315dd6"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "95f3b425dca34e08c6e5d34b31429d5699c4613b7c0adea6dbf2b592797c4e97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "0d90dfaf3b7199d26a0cd0c1f3d9d01baefb175f52216d3594a10453e3a00bfe"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "ebf319a899e2e57bf9127ecbba127973ce09138dabc05ffee1b296c2e185ffaf"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.53.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
