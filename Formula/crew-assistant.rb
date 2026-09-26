class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.21.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "1d7a1c308269fb9098fb0ee573fb32ef1827098d7a48a4f572407e225ff06852"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.21.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "4f7180508be8cc10be6c819d2d2c07730b3e47806643e786fbb2ccfd71359dd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.21.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "cafd386ce89a9abbd5de0c9ca4a5b1431b8db25552a2c79d36ade88836c76899"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.21.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "36288e5d78969d4632b5b7d47cd8414eea463c52de1960ed704d4f72e775d608"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.21.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
