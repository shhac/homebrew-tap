class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.47.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "8e9d7c76467c56c94f5d414c00af4f1f39132739c4dfe0eb0f72933463f82032"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.47.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "71d22af14cfef3fc05990d5aa66dd41e1650613cdc6df53044d290187cdb8145"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.47.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "40ecf8910e34d2d3d63041716bbb375365d496cb2dcd5f1990b4ab683ee18d36"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.47.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "ea294cb259aec122a1a3c06a658b5d9e0da0e9045c7af6525ddb1413cea3ebb7"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.47.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
