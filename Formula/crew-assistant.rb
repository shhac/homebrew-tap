class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.36.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "716b2c78c767a25c35ecc41eb6a9bab42fa0921fb2d48c7bb8277081b1a90a1c"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.36.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "17f8d9accd6f180ad2f5fe1ef49a8af5023e6ec6cba70f124e382c7e77450a52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.36.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "6444ab21629dd328cc6ff023f88ac15d096d145aa5eda22b40a41b08330a4639"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.36.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "593c67a17e0a0189f0809f046742367da10b34a36d8b6f882580fd04e11a972c"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.36.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
