class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.17.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "e8483707d61fc006b24e74f5470cbf5a9da09e2d11e87f4e0e427c603d6ea2b1"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.17.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "2ea603c7a0c9fd35d1dd28d2057c4f3be47da80b06ab09a5c03525d80d9b13f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.17.0/agent-slack-linux-arm64.tar.gz"
      sha256 "6b31a836977e3785665f485a8a61af450e46b40fea67acb8163729676d92c84e"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.17.0/agent-slack-linux-amd64.tar.gz"
      sha256 "350b35b794da67aa7231efc0c9a719e6424fe33eb68360e0e660cfaa0e602bfe"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
