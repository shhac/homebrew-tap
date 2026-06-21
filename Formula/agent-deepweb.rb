class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.8.1/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "7a310a55f5a79e97aea58990e305dcb9c39d1e5ec272457a97ae511ddc8edaa8"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.8.1/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "27fc4db3ff7b49e0bea92de21754cbecfeb1c8dd2835d9c9c895bba41ffc4e1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.8.1/agent-deepweb-linux-arm64.tar.gz"
      sha256 "c187cd9f92ec558c727333151f0046e42526d6c944269b5823bcdf6fb90dce88"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.8.1/agent-deepweb-linux-amd64.tar.gz"
      sha256 "6bc75efafa06d1bd506591ee2c8830cc103b344bb8c556fc3300693aa81b8dd1"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.8.1", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
