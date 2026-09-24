class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.13.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "5cf43399afc9f519c6269052ef62ef162d6ac911271b52bbeef36415e4972270"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.13.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "d9f2aff737de781975faa7ee2680beddb88fad9d8ac30dfe95e6fc2bfbab49e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.13.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "6f99dda2e1c11e0c36e717bc2987a667b910e7688839572982c01242b04e1acf"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.13.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "f8b84d7c4ea7ffabfca650acf7bc61383cd77fcba1d59f06833e3e5d834d6b1c"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
