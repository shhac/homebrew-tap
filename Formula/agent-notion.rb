class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.3.0/agent-notion-darwin-arm64.tar.gz"
      sha256 "80867e30192a63dad4c762f721cf4bf5d94ed2c63114c28e3ee102a68881f447"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.3.0/agent-notion-darwin-x64.tar.gz"
      sha256 "9fe61e7f90376c2d5c7a4872c99af1bdff1047fa039fa04f1170432464de7642"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.3.0/agent-notion-linux-arm64.tar.gz"
      sha256 "b21ffcdbb3a040ddf94caeeda35a1b00c966942e80c5b5a8a5269940e7a3d746"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.3.0/agent-notion-linux-x64.tar.gz"
      sha256 "ecbdccb5978bdac4048059559bb4208e446d9ae2460ce4461063fbe1322dd7ba"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
