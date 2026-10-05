class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.64.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "a4fc66693ab21021453bcd01e74a18f3fcaf37feb6c1e792f0397f47f67ebed2"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.64.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "234d26cff3461c81ebf0ef5003001eb51ff61761c7c0a523c3255adfad763154"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.64.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "e5c52874cc7b8a4c92cfae64d1fdb4c51311de1f37afd34d4dc9fc54f3c0a60c"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.64.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "6f315e043966668e86056a5585b9adea9d26d46f266af676bcb2b5918de602e1"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.64.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
