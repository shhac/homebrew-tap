class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.73.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "d5ef07bad72242ab0333fc71c183a14ac9d156774db1b970136e54fb1ad6a5ca"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.73.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "7d0fa1695525fc4a41dbfc88c488e29921995dad090777fb6e6e19710303e94d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.73.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "76d0111b4c772b63d800123346df4d8539a7b0d143bf8009d67fab855b902358"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.73.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "3e4e7526a5e5cb25dd6ec569d76cf40f100517597ba2432d615eb7a7057f7a62"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.73.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
