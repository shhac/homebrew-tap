class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.5.0/agent-notion-darwin-arm64.tar.gz"
      sha256 "e5112e62defaa310f469b5ef17ebc9591f74fc7f4f91ce86618364e8f5a004b4"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.5.0/agent-notion-darwin-x64.tar.gz"
      sha256 "27adba937e98d34e9b14b1561134e1c10eb3886a19178cdd3040f1b77ec7c6e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.5.0/agent-notion-linux-arm64.tar.gz"
      sha256 "0de2656899277c8ee529c1377d122836a1409f831b7009b416d098b0d1f39ceb"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.5.0/agent-notion-linux-x64.tar.gz"
      sha256 "e975aa4264c3d363c3076fc559cd5047f58d15724663b2c04f965cf38aa22a63"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
