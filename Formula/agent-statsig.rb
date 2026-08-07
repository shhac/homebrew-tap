class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.17.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.17.1/agent-statsig-darwin-arm64.tar.gz"
      sha256 "bf7b48ebe9ec379389296a76f99f0bee13d9a01b3a0f1c9e820f4b6cc396e1f1"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.17.1/agent-statsig-darwin-amd64.tar.gz"
      sha256 "03c89df31e8d427611ee1928fc1f36f2b658af66ed964548655ca90c61cd9488"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.17.1/agent-statsig-linux-arm64.tar.gz"
      sha256 "acba998d83742d45843907335d57b46d10d87ee1e2557d8155042904375c921f"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.17.1/agent-statsig-linux-amd64.tar.gz"
      sha256 "e8a02a2fe1cfd0f4910feaf83ddf62cddccfe7c80a9be6fa37d2e04fa2ac55bf"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.17.1", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
