class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.44.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "606b4be5558b1ef6d776dffcf0028946094b6ba1daf167bec8192327e913ed23"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.44.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "172e212ae99184cc6af7521830692f160c4d57b7507c31e58bd5f28621138b26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.44.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "727fe37f7f1259eb14c77f0a871a91bffdf1e1483d27f94bd7ca6d663e8a009f"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.44.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "600c604a9425d16f40fd865aebb9c1c8dc08b91c2b3567508520fd2663171aa0"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.44.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
