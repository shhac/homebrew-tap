class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.9/crew-assistant-darwin-arm64.tar.gz"
      sha256 "1135342620a74b553e8e257e489d1a2cfbf1b6b94ca248a3314b2316bca28c16"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.9/crew-assistant-darwin-amd64.tar.gz"
      sha256 "21f8a93be7ae47c62e82f9d3aa5e4ad3318e8bfec16abafade296fbe8179d9da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.9/crew-assistant-linux-arm64.tar.gz"
      sha256 "ac055f6fbd645188cc48d105c7b4925d44cb9ec3d4845e9932d30bee66a61d8a"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.9/crew-assistant-linux-amd64.tar.gz"
      sha256 "2991c771e8e0d431525efc3d479dcd5c73dd86f8c69b35b35034cffceb9330a0"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.56.9", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
