class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.4/crew-assistant-darwin-arm64.tar.gz"
      sha256 "2365ea5d17eded0a9af2e8ba0ac3e4af17d30b514e7ad12d5bfa7312c8257c48"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.4/crew-assistant-darwin-amd64.tar.gz"
      sha256 "e93c4bddf5eeeddeed3cd6a4fe47905cc8f86ac02906f3857d2f6555bbd57dc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.4/crew-assistant-linux-arm64.tar.gz"
      sha256 "ea40f68fc2e5776d18cf8702f47ec80a1add71ced6973e7d73295ae773f21ebc"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.4/crew-assistant-linux-amd64.tar.gz"
      sha256 "632a18a725338f468a54669a350633e20b7a819cdcf9c1e25cdf24d62d5964c8"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.65.4", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
