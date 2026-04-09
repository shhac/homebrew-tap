class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.3/agent-dd-darwin-arm64.tar.gz"
      sha256 "865bfa307c2933aed300e8551a9e616391d36b61d8d594b45f9febd1b361df1f"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.3/agent-dd-darwin-amd64.tar.gz"
      sha256 "5e9b3233bb683d7723422ee5e08e02163c00e4b0481a830e2dddd3407da61bdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.3/agent-dd-linux-arm64.tar.gz"
      sha256 "4c1b9937a5523859b93b2ebe3fb2d63df8313de67198cf04acb1af50834aae35"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.3/agent-dd-linux-amd64.tar.gz"
      sha256 "8c5761cac759383685de43588cf1a3cd1feb3b13f3bbb6cf6eca7c4d6ae32471"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.3.3", shell_output("#{bin}/agent-dd version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
