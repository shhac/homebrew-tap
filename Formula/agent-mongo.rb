class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.12.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.12.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "994bb00a7fce32ce0459c7c4b0dd75356f7ea7a5a1daa38b310b5559f96a2154"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.12.0/agent-mongo-darwin-amd64.tar.gz"
      sha256 "fa397c51ed93bfdb58b8f6059c2756eb2ce31678ec5b65b0b2d7e844606b17f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.12.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "dad94014b2a9f0d454e57d0d3b71735befee1c28387286f140c5ac831ad3ebea"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.12.0/agent-mongo-linux-amd64.tar.gz"
      sha256 "4e812e824bd8091aa39ecfbb62068a9d1a198970cb66411db00df2d07e286597"
    end
  end

  def install
    bin.install "agent-mongo"
    # Installs shell completions via `agent-mongo completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mongo", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "Read-only MongoDB CLI for AI agents", shell_output("#{bin}/agent-mongo --help")
    assert_match "#compdef agent-mongo", shell_output("#{bin}/agent-mongo completion zsh")
  end
end
