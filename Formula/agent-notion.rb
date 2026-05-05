class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.4.0/agent-notion-darwin-arm64.tar.gz"
      sha256 "3c2f87f21941cb906f556516bccb07260a205f03bb077c91be6082528cbce6fe"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.4.0/agent-notion-darwin-x64.tar.gz"
      sha256 "50c57e808f073050f606f4ed2c1f8cc6d11bb1443344e24e78f1d46cf9c5bb64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.4.0/agent-notion-linux-arm64.tar.gz"
      sha256 "2eb82a5e33e675fbeff65499c4333c3affc38da5ee5e4313bdbe316978a542ba"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.4.0/agent-notion-linux-x64.tar.gz"
      sha256 "1307722f9c3de283fda5ffd106b1e8cef92ed686aee7a2626c50cdf8f5e5e49d"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
