class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.10.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "1336cb65c4778eba322380665181932c57d0751bf55243b917dd72b6fa10b890"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.10.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "6fd814ccea9dd143ffcb892bd0ac28acddd7bea2fe2d6f6830e66746ae8658e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.10.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "0081854d6743ff18e309f5c1b3427df2f053f163d8d03077fe12439186704ba0"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.10.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "7037d5f6fc1c006784a406478ce5d11fc077a12db5e8c7d690922da3d29d02b8"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
