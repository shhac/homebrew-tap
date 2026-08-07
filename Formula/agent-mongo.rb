class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.12.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.12.1/agent-mongo-darwin-arm64.tar.gz"
      sha256 "c9f6a4a33a5d92947c675fdace63b1aad7c700dc0fbef6df964a4a3f38b98735"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.12.1/agent-mongo-darwin-amd64.tar.gz"
      sha256 "eafef51efbc020af693d52b49cdbad63449ea78cf44713c6049adc1fa6d519e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.12.1/agent-mongo-linux-arm64.tar.gz"
      sha256 "9207ee485d7088193712dcf1c1c0fce61d05211c572a0e5945a2102f39b2d61a"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.12.1/agent-mongo-linux-amd64.tar.gz"
      sha256 "5762473cd1c7dfebfc6092021d8412f990aac2c8048df0489cedf01ba8651780"
    end
  end

  def install
    bin.install "agent-mongo"
    # Installs shell completions via `agent-mongo completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mongo", "completion")
  end

  test do
    assert_match "0.12.1", shell_output("#{bin}/agent-mongo --version")
    assert_match "Read-only MongoDB CLI for AI agents", shell_output("#{bin}/agent-mongo --help")
    assert_match "#compdef agent-mongo", shell_output("#{bin}/agent-mongo completion zsh")
  end
end
