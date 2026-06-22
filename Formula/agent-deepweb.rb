class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.14.1/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "d1eec49158f92c38259a30c2bcacd4bb263b16ae55a803c5fc1b93a749ffe971"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.14.1/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "6a42d2a177d849e7b6a29bd2d211d14cf33d921a5ee5da85f097b8db338aa9c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.14.1/agent-deepweb-linux-arm64.tar.gz"
      sha256 "75db156741273f16179d9c0be267cb8870d6c2b610c313648fa99bd5494493e2"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.14.1/agent-deepweb-linux-amd64.tar.gz"
      sha256 "4ef01b75cf55b45c2db24ca6f1656a599366fa82af23be76bfc76e5e02acacc6"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.14.1", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
