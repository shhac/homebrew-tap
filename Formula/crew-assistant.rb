class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.55.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "696f8013ae46d9a0a391a2b509a57f9145dc5188883faf095649b9de548bb3a2"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.55.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "8c4f83ac143af1e218a9f257fa4617ab99b353361027dbc87de49baee6b2ad8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.55.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "28b78107506673a6596bff0efbffa4a32a6bf6bca6b38af568811863b26bb137"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.55.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "f14568bc422570f784b1413f85e29342730041d91a3fd6cba3edd61d23ec5233"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.55.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
