class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.22.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "880d25a02ae19adb7b54b8c06d627fdefa9a74ec2a5f127e31b5777bc237e1a7"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.22.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "4f7ff84358dd1d70317c8ebc69c6266849f972667296eee3c0d4e4afca30282c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.22.0/agent-slack-linux-arm64.tar.gz"
      sha256 "44fb2717ef3a801872087107bb95efafd94711e798d9c9a019242765683ad2c5"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.22.0/agent-slack-linux-amd64.tar.gz"
      sha256 "5a5c3cc455bb0c9f9ea0df14f0788c82d12de8cfd680b6e9324ff071fab94466"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.22.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
