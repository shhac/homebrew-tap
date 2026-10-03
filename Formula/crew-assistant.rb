class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.49.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "544007a8cf4337bdf5f431698578eb305d298f558a30098d36d3971ebbebe334"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.49.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "f39d65cc3dca6629a274350d1af1c7c18c699ac5e211cbabe593370d075f2d3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.49.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "82f73c32414b85389e088b8e81dd9f44f307de02948b892f9124ac86bd80f1ca"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.49.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "f152c3a33e985b2cf9f82eed957baeac7d41da5d8afd4b86860f260449894bc2"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.49.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
