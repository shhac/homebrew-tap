class AgentFathom < Formula
  desc "Fathom meeting intelligence CLI for AI agents"
  homepage "https://github.com/shhac/agent-fathom"
  version "0.1.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.1.0/agent-fathom-darwin-arm64.tar.gz"
      sha256 "4d2079123603c4a0093d61d3855ed32cac5d8e68069e9109105c61d7932f3f13"
    end
    on_intel do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.1.0/agent-fathom-darwin-amd64.tar.gz"
      sha256 "987970a4b2f38c65492bba9bd6df82d52625431da3c610d35bfb6495e4a41543"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.1.0/agent-fathom-linux-arm64.tar.gz"
      sha256 "ad81695cc6d8c318fd5a858c195f7bf8ac9ab9393b0cf89bad9a434dbcece373"
    end
    on_intel do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.1.0/agent-fathom-linux-amd64.tar.gz"
      sha256 "b02c28c0d03f34a75bf45b91c7e802609f3f7bcc266a525ce73b80e1be9b85c9"
    end
  end

  def install
    bin.install "agent-fathom"
    # Installs shell completions via `agent-fathom completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-fathom", "completion")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-fathom --version")
    assert_match "Fathom meeting intelligence CLI", shell_output("#{bin}/agent-fathom --help")
    assert_match "#compdef agent-fathom", shell_output("#{bin}/agent-fathom completion zsh")
  end
end
