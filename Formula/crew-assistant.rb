class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.57.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "2b13acd7f668a6c712c4d1fc9ab8dc6d4df2f868a44b0c989a23823c43a091bc"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.57.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "9bd375ce3c2bc3d406165876428c583bba15b1afcdcd287ed2a908ebca593cee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.57.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "7759f7cec7b23b12263f654cb103f755a1b9c5df2d33c35e0d6c07555607e773"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.57.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "00dfdec441cd793a3f4a60471c745cf5c921c0d061707971cdfff077a54c185f"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.57.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
