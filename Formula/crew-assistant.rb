class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.14.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "0750aec1796b1cdcd20c8e6a857170efb42a1492c44eae7453cda565c4aaa6c5"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.14.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "114915c37ccd933bb6505ce3c249f65938a19d92f2c93d781f9e33a8721bf91c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.14.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "5d213e270975467e0843ab18bed92a0a8d407c6d6bbcd35a384d5bd7db6599ba"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.14.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "a9acda68fdb0e24bd25f483900f6fc0718749c9722a7fb7980c1918f507826fd"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
