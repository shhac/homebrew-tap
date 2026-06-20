class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.7.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "a224198340c09aea12ad064b040e991d7acba963e8333f8c73c4924877af2529"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.7.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "af971f42dabc301d597b43c960b7bbd1c27aa95aa487978dde0f4c82356e1023"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.7.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "1e182ed8a966f9e4f938b42a7e094db12675ad5d30f2896f410ebbbfd4da7aa2"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.7.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "f8b98bf1e005fc977cfb578842a7184ed7ad75d13fef1c9f40a5afcc2bc413ec"
    end
  end

  def install
    bin.install Dir["agent-deepweb-*"].first => "agent-deepweb"
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP", shell_output("#{bin}/agent-deepweb --help")
  end
end
