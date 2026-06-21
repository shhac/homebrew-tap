class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.8.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "035df173708f5d72b5e4ef6541992ecb9163121bd3be7e31f847798844e1b16e"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.8.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "5d5b90924118c1a05084c4620ef1e5ffeffe10227a65416d73bb1919fabf9f16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.8.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "73116ca09ee3f71e9d759986a9a4ed016eb1676048e2fc1998005833bd0244cc"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.8.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "d6a2c263a8216ebd86c0f50e1606af5b6f6b87b9c0946d8fed4a9a58427a156a"
    end
  end

  def install
    bin.install Dir["agent-deepweb-*"].first => "agent-deepweb"
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP", shell_output("#{bin}/agent-deepweb --help")
  end
end
