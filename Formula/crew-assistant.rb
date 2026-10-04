class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.5/crew-assistant-darwin-arm64.tar.gz"
      sha256 "292c85337d2d322db80b5b80e1d338d7d62e9a9bede6effe57f410016729b9bd"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.5/crew-assistant-darwin-amd64.tar.gz"
      sha256 "da59eb5fcfa3c691d137f42959008eaa424fa35792b8176f5a538fa8b49b8958"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.5/crew-assistant-linux-arm64.tar.gz"
      sha256 "6dfc77938af234fc2ac7c782b577d520da438f058b3feaa3cd3551243603857f"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.56.5/crew-assistant-linux-amd64.tar.gz"
      sha256 "e25e43bf22a5af9427bdb4ed3b5d688c07c4061cc2cb30f96c62f27cf0370dba"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.56.5", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
