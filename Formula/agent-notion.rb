class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.1.0/agent-notion-darwin-arm64.tar.gz"
      sha256 "5bbeda230311376647b8af7cd4b0a927f24b32d7a148719beafc7ee6bebc83d0"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.1.0/agent-notion-darwin-x64.tar.gz"
      sha256 "4a31be7253f815645cbba706c8da28a688e469b61e090f199c036ebb3aca3440"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.1.0/agent-notion-linux-arm64.tar.gz"
      sha256 "2966ce4c657df9cb8010147c3b5f21995c46e8a387fd92ba91528020e5f92c16"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.1.0/agent-notion-linux-x64.tar.gz"
      sha256 "e806f80237663817c7ea68de929d66fc309e7e8f8016370f9d7f4c0134165e3c"
    end
  end

  def install
    bin.install Dir["agent-notion-*"].first => "agent-notion"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI", shell_output("#{bin}/agent-notion --help")
  end
end
