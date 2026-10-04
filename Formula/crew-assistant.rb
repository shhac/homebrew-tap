class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.7/crew-assistant-darwin-arm64.tar.gz"
      sha256 "f921e1d85f00a99f1ca870112882eb9f39ffeed80a4bff2a36568e38669e44bc"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.7/crew-assistant-darwin-amd64.tar.gz"
      sha256 "dd6dffb7e5c45b10606f038ae7ca1a070a3136c0508a30f832e30b0dfe0f89d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.7/crew-assistant-linux-arm64.tar.gz"
      sha256 "469e8a02e4c3a287bca5e8a9773d140a5f9a4f6f21de5455735e47ee8b0b0fd1"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.7/crew-assistant-linux-amd64.tar.gz"
      sha256 "0adddbbf942a2bae95039ea2c878ba64d3fc08219bbc17ab5853994656912452"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.56.7", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
