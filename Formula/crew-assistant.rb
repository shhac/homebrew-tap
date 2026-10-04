class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "ad0366a539d9f4d0912f3b205d0a6f1be75a145414dd699693b01a96ee38ab82"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "82a4b3fe560bb1b5eef059133737b64a8326c38dee47412c41535b85c3e015aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "a9bd94067e602004f7d3883ca0bda0fe571fd2874552cdac86a5fed9c909002f"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "af974fe51f7fbc506c780d17bd12085c503bca04703eb47787137ae260d08ee1"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.56.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
