class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.66.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "aef3fd2c7a49cf3d4f71ed5483d876080a85610e58522b601e54d2057ea9e78b"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.66.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "46342a5a3a3c8f233ab26ed4232002de811b3b3afd903c515a0ed363ae82ad09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.66.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "538ed2147a2be03501e759353b2fdfe8751857ad3cb68d516e5b520ca6062701"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.66.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "184515a2043de6f6d8c90e272ea69ebfa962c4ab37fabef8de6d38406cf5abb9"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.66.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
