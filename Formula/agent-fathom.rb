class AgentFathom < Formula
  desc "Fathom meeting intelligence CLI for AI agents"
  homepage "https://github.com/shhac/agent-fathom"
  version "0.2.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.2.1/agent-fathom-darwin-arm64.tar.gz"
      sha256 "8e0f03ac1885b7e9e80c81720a1d7b72bada4c49037b8bca2bb55a719451f01a"
    end
    on_intel do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.2.1/agent-fathom-darwin-amd64.tar.gz"
      sha256 "fd69567034548c32b56e5d569d29da2ffd24d0da290fcd5fac8f78cdee9808a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.2.1/agent-fathom-linux-arm64.tar.gz"
      sha256 "c62acadff147a62df2c97b971458bc34f0ad1aed79cbc24336f8ac38f8023f9a"
    end
    on_intel do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.2.1/agent-fathom-linux-amd64.tar.gz"
      sha256 "436eeba235d66a3d7c59dcbe418266efe1c7cc03b7f09f9c09cef9c81c9c9b13"
    end
  end

  def install
    bin.install "agent-fathom"
    # Installs shell completions via `agent-fathom completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-fathom", "completion")
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/agent-fathom --version")
    assert_match "Fathom meeting intelligence CLI", shell_output("#{bin}/agent-fathom --help")
    assert_match "#compdef agent-fathom", shell_output("#{bin}/agent-fathom completion zsh")
  end
end
