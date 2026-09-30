class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.40.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "0982d737e7f0bf29254d8f765b8cde2f6401a2b379a06a19e4c46f3d670bb8c0"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.40.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "d6fea7a3704e3158df979089b3eb5b878ed1cb74fef9f2d7db226f20fcebc349"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.40.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "cd2beeee5e4910016ef8616af4f14967926bfdb9eeb2d735df2b7ccb8ebfdce0"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.40.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "6df63c3cb4ada6db9d9d14c3a9d955379d79d119018e8e7564852e6fade13bcc"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.40.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
