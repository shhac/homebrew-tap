class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.17.1/crew-assistant-darwin-arm64.tar.gz"
      sha256 "287b75643b40557e62f408613b790ea7314105ad5b8ed76e62fc86d36813a274"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.17.1/crew-assistant-darwin-amd64.tar.gz"
      sha256 "94b6f6087328862a8ab5f7178a8b85736d609f5326778588ac00422e1b8ed1ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.17.1/crew-assistant-linux-arm64.tar.gz"
      sha256 "43fb752bf1f43f3706615f49ed33346a09a2f824b1a8b493a84fbfbfa772fefe"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.17.1/crew-assistant-linux-amd64.tar.gz"
      sha256 "13dc5926b265e36633af8af0b5631dda0cced63d4eab60e506cb7f5c2944529b"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.17.1", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
