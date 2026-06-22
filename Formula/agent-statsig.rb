class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.12.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "1e923b07fe9a4105bb389f24b6ae246800b7860e435cdd6524df92a959ed93fc"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.12.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "3e4e11fc5669116ec92ebb55da5e85082fe07715b65117e10e561cb5e620c3be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.12.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "dbb6adde169b04c7a92908593d4da34e36012569c2f7ba2c68f2e1d53f413951"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.12.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "80661313960d8a933c364d35b7ab1a343d154019af3da46099f4795b9dadf6d9"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
