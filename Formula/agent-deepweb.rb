class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.2.1/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "52583dffa043380625382228ec72203018e8194edac66186b268a6585c415416"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.2.1/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "041251fa6d97ac3a2d60845015598ca7dff07eb0c39d5232335da96598e7cf0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.2.1/agent-deepweb-linux-arm64.tar.gz"
      sha256 "7eb2b6d06648c121e57e228cb3553f59d29c4d41aed40765984a2ce14a5c0dea"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.2.1/agent-deepweb-linux-amd64.tar.gz"
      sha256 "d3a5d47abfd6d50b63078dfc60974721838e869a1abf0ede822b6ec91a049ae0"
    end
  end

  def install
    bin.install Dir["agent-deepweb-*"].first => "agent-deepweb"
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP", shell_output("#{bin}/agent-deepweb --help")
  end
end
