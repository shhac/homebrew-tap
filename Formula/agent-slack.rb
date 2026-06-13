class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.3.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "20e5f688d8f31bafc8b5fdbb19f35f3c242e3c3d245939758ad4d97c0a74cc0c"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.3.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "24db8703e743217d5639b6f78766694b90b4a29410693bfe5acdf2b026f74918"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.3.0/agent-slack-linux-arm64.tar.gz"
      sha256 "e7aecae313c1c7a10bf30796d3113c4029e46f36496248f4aa1d549a1380ed06"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.3.0/agent-slack-linux-amd64.tar.gz"
      sha256 "182b73b14fb67a66aeab12362a93ebf7b3bb3f3f821ee4c35d0e230b06ace954"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
