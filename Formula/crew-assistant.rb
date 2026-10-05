class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.5/crew-assistant-darwin-arm64.tar.gz"
      sha256 "471dbb95a161dabade872e63c7fbf2a6c55ac4fbf370618b78d1ffc414057d73"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.5/crew-assistant-darwin-amd64.tar.gz"
      sha256 "20311373da2f2949d8aef98e49aed04e3375be247393155073ee12b7052ed150"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.5/crew-assistant-linux-arm64.tar.gz"
      sha256 "b2e24afe4978631fbb9fe7dd17fb3243c9af78272cbe71942ecacfaa298cc81c"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.65.5/crew-assistant-linux-amd64.tar.gz"
      sha256 "e878ebdb3e391aebac02f19959347829d6e34f0a4740fd969b276df860743912"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.65.5", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
