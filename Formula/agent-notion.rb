class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.1/agent-notion-darwin-arm64.tar.gz"
      sha256 "0b946473320619d9d5c24ca277775a19014cf215a68025a31a74fdc857fe93cd"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.1/agent-notion-darwin-x64.tar.gz"
      sha256 "f682ead1fa39b17962cc13e7787e0bfe43ff8dbeda8659d090ce15a9e80ce52e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.1/agent-notion-linux-arm64.tar.gz"
      sha256 "ad9890b01b8b9f2427c52355bda8dc57c71bb66117641cf8bea6a5e4d8485a3c"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.2.1/agent-notion-linux-x64.tar.gz"
      sha256 "f59921b40708cc0b5d9ad7b8b6ab8b83c5036f6fb785878e4e361023cd42b909"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
