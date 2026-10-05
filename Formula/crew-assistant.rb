class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.10/crew-assistant-darwin-arm64.tar.gz"
      sha256 "f3e6578a57ba8ebb83658108c34a55eab09d911f01de5daefd7c3f3aeab73f50"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.10/crew-assistant-darwin-amd64.tar.gz"
      sha256 "481052d56fec005ffe2dba180608105a890752fe32df2b47fe6354d4a9d2f7a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.10/crew-assistant-linux-arm64.tar.gz"
      sha256 "2da5f49de31630e788441c35378d964238719f83b0ccc087a166a95c845addb1"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.10/crew-assistant-linux-amd64.tar.gz"
      sha256 "c8b3812713c996f20d6871d176f4dc23f4fdb1c059fec0108698b71d802559e6"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.65.10", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
