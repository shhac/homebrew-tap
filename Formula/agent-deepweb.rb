class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.4.1/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "b6c04da45648b9665ac63766e98cca8b61e7cb88960809846ee965312a7ebe0e"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.4.1/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "209ff4be94ca7b537343be367b5855ea25a3b998d9a3ca4209176d54056f05be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.4.1/agent-deepweb-linux-arm64.tar.gz"
      sha256 "83c4804dbcf70c8f1f323a23fdd60e24311b7337421e08ba383eeda31267840e"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.4.1/agent-deepweb-linux-amd64.tar.gz"
      sha256 "31a5261b34e473d92ef371bdde98beb93d128c35e97107121173f06bc6000636"
    end
  end

  def install
    bin.install Dir["agent-deepweb-*"].first => "agent-deepweb"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP", shell_output("#{bin}/agent-deepweb --help")
  end
end
