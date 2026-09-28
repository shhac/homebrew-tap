class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.22.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "488bfd7e810f6243b9ed657e7b39be19c815bfbada9e237e7c161508e5f6c7d8"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.22.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "77979683ca55c00d2fcced1e414fe80072ac3f417787e582c8c13e0414375255"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.22.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "8454d9471e6aea8cca444fd156200b49ef44bd6bf3c83488ba6dc545eaad2cb5"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.22.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "66352a699371ea16e539ff490415ec480f8bec55b73cb1c7739fd43a9706feb5"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.22.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
