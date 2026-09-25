class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.17.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "69c5a49496c033052900dd9b91adb3d01f45c1fa46bd3fac3fae0c5aee78d725"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.17.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "d21c76d1953db0db05f002bae3ece39092dbf495342e2789db9aeaeb4b153c8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.17.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "cc61077be0062b7c1c5a9478fb78df2ef4ebb5bc3b546cdebe5c9cc61b609fa8"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.17.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "b0cf9b0d994de40d8baf4f3e95b5ad635748df03e36dc17f0710f6fba6bf7cfd"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
