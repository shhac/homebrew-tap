class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "001dc0f29a715b72da142851f83a5b4d64639d5f62e233798a7289abbe3d56e3"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "f0eaabd31b7455cb028b1ee31fb77b70cc3ed3d2895ee3de686e51ed3b127e53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "2dcb50da1e912627379702f3623d9324060436d7107a8f3944219f54ba7f5fb8"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "b46dbc8fd768acb62ab997b61d3c177441e00e6b34ac85bcae57069dc983939c"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.34.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
