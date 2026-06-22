class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.12.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "0fb86377a90dfffc46eb4ee5a1f6900e23b0f43f3147cf92659ad2caebdb6589"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.12.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "e30614f05dea42210481bde723d5404abe9903ee70eeea52deab1d255ed73a96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.12.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "7165b37b26bdd67983deff163d4c6e4e0854e2af583b5e2376a20932ceb7023f"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.12.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "a196cea9cf21c5b175604b926bd30d8e1c7eb995d278bdd5fd541054bc8c80bd"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
