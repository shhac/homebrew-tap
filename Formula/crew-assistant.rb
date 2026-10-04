class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.61.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "bdde44cd48f0abf71ca2404b3824c9b4be6e2043cb7daaa426712036309b6eb3"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.61.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "2ab44eb0639587ddc871fbebfd8b2222ecc3dfa95b6dc9ad3ca5be9186fbcfae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.61.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "5335b96b727752840a33ecce93d7b1576caf7e6f253d591a541cf379476a56d0"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.61.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "02a9e6f173a18253964a03e2af8ac2c0a2b68d50bc4d2d3dee84dd55f8ca8d5f"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.61.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
