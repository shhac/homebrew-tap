class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.30.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "35aef5f123be881efdcab59c01f031645bfaa6d6bb20668568c783ec35205d51"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.30.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "ec3833bb5e4897df32f885be3b62f1c27a19bc44ee613fb6daa1c72881f6508b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.30.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "1609fdcffc9522e348f7552fbaa6179af56114bbcae30923d8b68c06ca2b0ac4"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.30.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "dd6c2318d3db6601808eff13fd7fe76ef74d921b1b9c7c214290045f8b56d2af"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.30.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
