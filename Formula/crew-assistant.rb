class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.57.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "646d1a8ed7721cfae3717130ee33d30e4aec40820b76aa7067f1037c39db16d4"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.57.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "82316131ef60fba3f62d041f6deb1ecffddd84ca1f09d3f84968e62f0663f794"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.57.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "641891ea997897aa772347e21415281ebe3f975f6b767139bf8206bb7eee7657"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.57.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "3e5f0f1ba42b9d29efcd29ff10bd9f071f9172ab042413ccc234e7348ea70dc1"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.57.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
