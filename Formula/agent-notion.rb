class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.7.5"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.5/agent-notion-darwin-arm64.tar.gz"
      sha256 "11d1ab7f287691ba2a2e8eb24a40fc0c292617061bcd1c94eef2e55b2a992303"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.5/agent-notion-darwin-amd64.tar.gz"
      sha256 "89768f00f7a81b95fa5814219b60c13204d2aaf71593fb2844a7c0845b8dd20a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.5/agent-notion-linux-arm64.tar.gz"
      sha256 "1399ab7d397eaa1edece32bed8fcf1932718044557715cbddf7c2c008329ce8a"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.5/agent-notion-linux-amd64.tar.gz"
      sha256 "ae7475cd1beb6945ba6a229cafc6b6a7d97a17d4721694911c059f3a7bac5267"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.7.5", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
