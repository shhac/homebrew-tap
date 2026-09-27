class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.22.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "df73717fc9a01834d37f82e004668ec4c98eca65543494235550c3ad9eeb4e91"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.22.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "613565c47903c045fbb33e4487eff286e94c4179e4c5296909e995e31a535c5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.22.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "6a40501c23bdda1bfe3b8768c7e33ce4b60c0dc9422c577dbf36116d363c5cbf"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.22.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "e814663d334f4a68f2f4de466db8f112d1062eb4dcb346c6a307367ec5c9dcf6"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.22.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
