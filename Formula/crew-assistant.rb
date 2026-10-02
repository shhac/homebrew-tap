class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.45.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "69d4e5270b496b86f0dfaa013858779f5b33c2745586c4ea77395f2f97977bc0"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.45.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "1f76ccc77705176c5c6ef607a38839c2daf5b1738831f4ffa3465027d83790b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.45.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "249a794bcdc03745d364a90c60c07e92f265cae770415fa8898c38f436a4aa32"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.45.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "262fd8b0c1195e306e7715df58c7ed99038a1c154d7e4c8f0ff414c81e42c461"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.45.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
