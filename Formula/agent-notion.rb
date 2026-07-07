class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.8.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.8.0/agent-notion-darwin-arm64.tar.gz"
      sha256 "ae2be6173f8990692b618e8de4bc8da166888f653c5ce0e203490c0cf136687b"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.8.0/agent-notion-darwin-amd64.tar.gz"
      sha256 "80ddaec8b35aac97793f7145b162a020a807ca2d7702a1daefaee84dfc2e7ed6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.8.0/agent-notion-linux-arm64.tar.gz"
      sha256 "3485f3caf1248797e55323e3ae82868a38de5b7286daa4ce3f4fdf691a4dcd25"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.8.0/agent-notion-linux-amd64.tar.gz"
      sha256 "e724b9df9c5093082960cdc85b2a04805062a9708da03147ccb888cc6ac23634"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
