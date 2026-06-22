class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.16.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "b94a339293eac8d6b88389ebd4fbf61f3d37f3161103cd89e6082fc67e9a45de"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.16.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "0fb23a06dea191f640ccec796b1ca77f5156bcba2743e6de463da86252487ee9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.16.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "e8f3f3631b8742eb8828a80b2af1597e5f27b674f2acea8c4a00efdcca52b964"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.16.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "07e66e35fa48ed778ea433689ab8ef110b5c595e07c17f967726ed9763a544d1"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
