class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.10.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.2/agent-notion-darwin-arm64.tar.gz"
      sha256 "fd34cc90e65d99caccc3daf3844206275a19a2cde24c1f80e6138dc1a9a8f2cc"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.2/agent-notion-darwin-amd64.tar.gz"
      sha256 "7eae31fc99f365cbb3287efe2b93f91788766c32c0f63974e2b96cf40fbec8b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.2/agent-notion-linux-arm64.tar.gz"
      sha256 "7cd3fcf18a0bfe38b8d34d698b262352211e9257c2e5c7c2b12c246950772497"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.2/agent-notion-linux-amd64.tar.gz"
      sha256 "dde020e097f5cf81855508eebf7f9d91ecad1cd5b3f2578359c35bf8b9a2c9fc"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.10.2", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
