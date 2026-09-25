class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.16.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "57424f36293154a1ee61811996a4a18104d84ae86472122cc809e13a12e2f75f"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.16.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "aadd05d83b3fdfad36ee81034be6ead2e5819d55762dc65f837737ccb0432a7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.16.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "edfb532f1849e9a4a2030386bdc68d7c15e437effb48441dcc1688c9e19906d6"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.16.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "890c6236e9e3908b367b603f4e52f3b21be8f541629aa40712dabb761ce71d65"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
