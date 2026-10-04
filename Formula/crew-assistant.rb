class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "bfe1722a8a91b7a1816295a56609ed9bf3fb7d16b09cf429dfc2f8b5886583b4"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "b1fd8bb50f1d9fbc82ea6649418f5bd649777032906b261b1464ca636e65288f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "6fa32a33ba2e72c4e077f819d99f6086904f10451386ea0a7b581479b504aac5"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "14d6a6ba0e8ae5d124491823fd7f43b40d521582fd59189ace9d5a2b9f36aa09"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.56.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
