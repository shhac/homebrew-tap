class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.8/crew-assistant-darwin-arm64.tar.gz"
      sha256 "1523ad4cbe0e65a9a1b4888d2e0f895d92d9e4df6b05d4e8e21fe0b10a621a06"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.8/crew-assistant-darwin-amd64.tar.gz"
      sha256 "5440cc8a807cfd7f677dbca2a8369856eff4cd8d2be25b07340f7da716b31757"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.8/crew-assistant-linux-arm64.tar.gz"
      sha256 "7fbb990a17ea87211ae55cabeda5f0995195bb5a63e665fb95b3953f96484fe6"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.8/crew-assistant-linux-amd64.tar.gz"
      sha256 "988b1fb7ed5e432ab3ea4a5dab6c85a01af0d856f20fbc89c9f49ef0f46a9ccd"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.65.8", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
