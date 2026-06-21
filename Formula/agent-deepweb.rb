class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.9.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "261ec78d0f052fbe112ef3500631e9c790a07f9deb8f10b1405aae1cf8fef076"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.9.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "f2a898fa6768af71b29ceb1a5f0caa9175f7790db47204ec9824604dc1b31dc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.9.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "ef879b127c04ef711444689561b12f9861357a37b2380f3277edf0a1ee812594"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.9.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "b5f532c23bf9cfe37067569b4749ea99fa5678ff0d0c5d67ddf4a2441f6ad444"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
