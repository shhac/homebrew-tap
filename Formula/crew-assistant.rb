class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.68.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "bfe9067ccf073c5e60efd581fcde3249d330131038c242b42963a1057987f448"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.68.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "ac4c485ab8c24a8146307fb6413583eabc3641f1dd49f394b03ecde2d021fccf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.68.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "d13005d638241eec21952d66a3fe96465a28afbeb927d1942244efd9d586f477"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.68.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "a2b5677f0c53686a2a5ce076fea0214d008c932227bed54689a2302d68b0708d"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.68.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
