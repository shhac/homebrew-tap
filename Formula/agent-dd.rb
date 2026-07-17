class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.19.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.19.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "363e04914026b7ef402d083a23a60716bd860e1508ba136f6416cfd312d94da8"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.19.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "2a0b18be45678f7d46472066ce3e5942950050f001314783bac71396ec41f91c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.19.0/agent-dd-linux-arm64.tar.gz"
      sha256 "34b3d3e8b4c60a10c034ad98854105065c659519fb71d7bc2553f016ca249be6"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.19.0/agent-dd-linux-amd64.tar.gz"
      sha256 "e792e40bc93db98dda27b664c5ead9e9900a9ff7325fc8cdb06c789da9f4c36a"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.19.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
