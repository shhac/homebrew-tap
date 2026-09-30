class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.41.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "df4f9caf278f9b940685b0641c956c5bd1f54120585b1e7a8107b08dc3792b58"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.41.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "9e622b903718fa93c146e7e53eda5184df6abdd81587d24a9bdcaf1c50f0c33d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.41.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "f71fc373f76b9a88491ee33232296f415b77d74618695999f73e139eecf923d3"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.41.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "ae1625df0c3c903bb85fc6f0a8309a09b8f35a439a705643872a5fedf22f9a69"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.41.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
