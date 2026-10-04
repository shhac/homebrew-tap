class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.5/crew-assistant-darwin-arm64.tar.gz"
      sha256 "0ef684f47dde6ce291609e78d6cdc2c52535da945c987e588587e87f7ff1b3bb"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.5/crew-assistant-darwin-amd64.tar.gz"
      sha256 "fa787120c6f5f66e78c68ac3473cd70ba14aed4cc0a7f24d98b3825abc724ac3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.5/crew-assistant-linux-arm64.tar.gz"
      sha256 "9e80a48f3598afb3fc7a34ea17eaf08c1d95e88375a9c4dda6ff5798ee580648"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.5/crew-assistant-linux-amd64.tar.gz"
      sha256 "7c05d88d58fe24bb564c06eed3dfba7a53ecd61e9bccd1e9eb018868049b4143"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.53.5", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
