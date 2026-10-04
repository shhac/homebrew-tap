class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.2/crew-assistant-darwin-arm64.tar.gz"
      sha256 "9056b9fd52f2b45ee7d35a20f34d1ed8e13ade785d1502313e64dbc97e3e3154"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.2/crew-assistant-darwin-amd64.tar.gz"
      sha256 "ed2a48ccb9b8ec851196fb4f5809e57802d0dc849fb9a9f9020295be4b52a258"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.2/crew-assistant-linux-arm64.tar.gz"
      sha256 "67c65fd1c059a40ad6b1b26aa8fa7ce515d9532793be2c35ac98b6987e1f2052"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.53.2/crew-assistant-linux-amd64.tar.gz"
      sha256 "1dbb1a96ee8818dba17387834443683f75f2c069d9524352c383c957071e1f3e"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.53.2", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
