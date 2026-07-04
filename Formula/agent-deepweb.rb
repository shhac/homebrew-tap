class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.18.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "3f436c2b93a011809ec9f3137378134085f3d43b245b0b0455ba115f5896d7ef"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "db34d0e2528a431f4fd1498d676d294a1a71d9649bd57285b347db93f1610879"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "ddf88ddeeef0371786c5c066004d43229286fcd020773cc441f872336e9de698"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "f6ddb9125c610333a60750b9228fa3faecb4eafd704e0b0ed2346d6a2f8569ab"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.18.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
