class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.13.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "08cbd0039798afd247c41c6eda5eef0697c630d1fe3b7940204a3630a0b49db3"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.13.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "1aad2df86252d6e26eb4d10106e216bfb71aff8f1b141597fba85064ec215a66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.13.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "f4a63733f43504054d3cee4bf87f35b7761a6cbf6bf2b8074d88c61628b1f94f"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.13.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "febe0436e01a9c175fa1009950ed641875f6ecf001fb7cc063fc9a681afaa4b2"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
