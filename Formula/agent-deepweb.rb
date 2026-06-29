class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.17.1/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "a1021d4dcd18ef76bef9469a664c340ee24a362535710ce99d17d5adad7eab7e"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.17.1/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "fec7a7512226240c13f0b9b4cfe4e0f053d6af3dcf665a18016d7fd45811a1f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.17.1/agent-deepweb-linux-arm64.tar.gz"
      sha256 "85d35448b9704b6838cee79db0d9ddfb9cd7db7c88e237d62ffe5a9f71ddabec"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.17.1/agent-deepweb-linux-amd64.tar.gz"
      sha256 "08945eb3ea2141280a6d822257ab5bc4cb5081c4a73e8b3a35747dfaf35b1ae5"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.17.1", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
