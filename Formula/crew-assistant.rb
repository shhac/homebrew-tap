class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.23.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "a1215967e7f04008564d128f6da6bf225a4eb5d9ade8ce273a81fdfa2e1ecc28"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.23.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "012be31d9b0ec6783f2ba81e5a80320031bb4d011d26a1917414ae684afb852c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.23.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "1124b31b10e5a140c4ff3a252ec0118293e058042e7e1f0a8528b955fa06ab8b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.23.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "04d5b7505c3edcbb3cc4c9934209f4b3cb25f450e1fe3354425472a61a0ae4bd"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.23.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
