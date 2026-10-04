class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.58.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "f1aab549b634d6f18f847b0919badea6bd440fa1f52bbb50eaff91c6b5722351"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.58.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "4d0224c0e06822240f99a52cd6eddfb558aeaa5aa82a89799322f98321f4bff5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.58.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "4f3b661cbc91a19222b6fefcc37c5d4652f7605908b0303f5c73d9cc66e95ab8"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.58.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "3be989d03642ad113adfc063519d0e3d71a949f6eb0dcdf484e0999b66e0c8ca"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.58.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
