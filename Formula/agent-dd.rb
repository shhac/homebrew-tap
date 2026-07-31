class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.20.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.20.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "f98cc4057d8d62236fdb84126d132b43e4ecc9b4e670cf19cf7ab4bb957f5982"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.20.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "08229f081fb04d48c86ffe22fe3b1c3e713c867a87fa271870b7bf949a61936b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.20.0/agent-dd-linux-arm64.tar.gz"
      sha256 "69dcb4a5855fdfed581dea3e8e213fca408529d3bacc632df74243b8a6c2083e"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.20.0/agent-dd-linux-amd64.tar.gz"
      sha256 "b372658e606715e04fb109d97664dd62a91c9bf8a10ec618e71b3a7b5d84cc9a"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.20.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
