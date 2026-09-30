class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "2666c0c9e711dc4191677202508e50eb3bbc61246d9f083d1dd859d9c824d046"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "60562bba3a38b0efebf5e5083fde3ccc502940c89d802ba105fa264803d1797a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "6df71ccb80adc141524de5acab7d86a0b1c539b90d3554366ea2dd3be4413fc7"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.34.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "8e1c190f252fdab320fb06aa7d65c9f493e07633cb2aec6ff8db6bb30da70c4a"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.34.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
