class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.48.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "acf92b238967701aebd000d380bbd75c469c455b392778e38e1aecfd2ebcfb05"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.48.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "e6f9abf9f6e4749abdce678ab7cd3f6d17cbe83dfc2ad963e45f56f17f371031"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.48.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "4ab4223c7a71fbc7f9ec99e85ca1cffdca8f18765f731f2a44c1056eddfeede4"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.48.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "2d746a6a42bdc32fa70ac80fcf2a76e64a19d73288f8ac830087a559b3dc04b4"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.48.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
