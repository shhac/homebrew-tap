class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.70.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "b50db7dd88eeeda9006c01a1047de51619320039e9e277a33979d44b365c98eb"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.70.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "c6ca48ab9ab19a399e4b8928d4669b3930eac126c4fef385bd900c83e7bca055"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.70.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "e6b566c699837f1cdc762d98a0e5a7bfc357614b1ce281167a13d87d14a39287"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.70.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "4bf04d039465510d76d15e1cf074baac305dc1e05ccd5c27be2d424c9603168e"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.70.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
