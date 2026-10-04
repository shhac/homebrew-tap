class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.54.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "df413251e1516a873449dda56437f53b7004c531260897eec51ed60628162aac"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.54.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "9f8236b8f40978df8ef5f999e2e34d77d77088079d8a9c2363ab7b1249108e7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.54.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "43e46e5dedfec8265cb870f8b6196744bbfc93cd15a6a39df4398fa54aaefed1"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.54.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "61973b8bf83f9f8d4e43f22503653d03cf05085707a20b10a3110734c2a2ab46"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.54.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
