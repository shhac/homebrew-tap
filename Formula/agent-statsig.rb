class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.14.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.14.1/agent-statsig-darwin-arm64.tar.gz"
      sha256 "527788f53c559b607cfd3b2cd2ed56c528b9d5b4ef4765ae45e67e2de477e6d2"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.14.1/agent-statsig-darwin-amd64.tar.gz"
      sha256 "540e47ba2140e9730e882b00b382ceee7f876e3ac74cdb76a8b320af42f49185"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.14.1/agent-statsig-linux-arm64.tar.gz"
      sha256 "06a23ca4690d3bede4bbb88d395b29654bd312a0f5dfd608c8ccd09d1c182881"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.14.1/agent-statsig-linux-amd64.tar.gz"
      sha256 "cc443bdcb7b4009d9d16159d571ace6cefe343ecbe3c5bffa815be29a76f69eb"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.14.1", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
