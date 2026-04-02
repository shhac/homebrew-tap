class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.2/agent-dd-darwin-arm64.tar.gz"
      sha256 "3d73b82b18cb4dfd154e3c223eed6a2bcec92cd7bd3c45915eba55f216510a29"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.2/agent-dd-darwin-amd64.tar.gz"
      sha256 "4b4a291c5a1bccc234a1c54cfe7deb38d7a28aa49ee1fd0dbe4c4385bd98f23c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.2/agent-dd-linux-arm64.tar.gz"
      sha256 "ed15f16f6a05557cde0b62747987c52f0b49617a6134cc6fb7e72ffb6dd69eda"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.3.2/agent-dd-linux-amd64.tar.gz"
      sha256 "cb1013acdac541ed7a03d13a11ce3aedc22b252e70fdef6f78949658a13c2a0a"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.3.2", shell_output("#{bin}/agent-dd version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
