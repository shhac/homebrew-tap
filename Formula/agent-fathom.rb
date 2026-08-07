class AgentFathom < Formula
  desc "Fathom meeting intelligence CLI for AI agents"
  homepage "https://github.com/shhac/agent-fathom"
  version "0.1.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.1.1/agent-fathom-darwin-arm64.tar.gz"
      sha256 "f5a030fedc246e6173d5fae57903c6d4cc7a0f1538ef78d725b4a107daa9ba66"
    end
    on_intel do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.1.1/agent-fathom-darwin-amd64.tar.gz"
      sha256 "d6474443c58904eeaede9fbc8ae91ad006a890355040ffe2efaa3dee103f728a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.1.1/agent-fathom-linux-arm64.tar.gz"
      sha256 "6c9c7795d241e4e4a1a8baa9c46a60cb940df6bee5701b3cad5d53356f57e9dc"
    end
    on_intel do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.1.1/agent-fathom-linux-amd64.tar.gz"
      sha256 "a3d417ca7dad817bd125f2c2a3d215a7a787a4060bd959735be8c20087616d14"
    end
  end

  def install
    bin.install "agent-fathom"
    # Installs shell completions via `agent-fathom completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-fathom", "completion")
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/agent-fathom --version")
    assert_match "Fathom meeting intelligence CLI", shell_output("#{bin}/agent-fathom --help")
    assert_match "#compdef agent-fathom", shell_output("#{bin}/agent-fathom completion zsh")
  end
end
