class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.7.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "6410e786c7457a1c664b5f805a2f43d43b98b867357b85e157b73bb6579b913c"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.7.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "aa849d84b99962b12956efb9e7e573e162a21e86c7f6d0e9d9a80afba8fcd0f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.7.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "68d09e91ea05d0f8cbc3594784713e92c5c7c22dd16d10a06ab8e8fc921e8759"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.7.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "6d9ae1707148f5fe9382baf4eb8f67ca706fd28b3cbc7cb403de7ed084a726f8"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
