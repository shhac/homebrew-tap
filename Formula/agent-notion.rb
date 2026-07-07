class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.7.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.0/agent-notion-darwin-arm64.tar.gz"
      sha256 "195d2d12053bb642ac4d8e5b6472b59482616ad9e4da0a7ab48f9da9f92a231a"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.0/agent-notion-darwin-amd64.tar.gz"
      sha256 "f8efb883c9edeed7681551079f28248b36829dfcf86745660584a8e4b66800d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.0/agent-notion-linux-arm64.tar.gz"
      sha256 "5520f471fbac56c3acc28656bb3ca9876bf1680f18b8d814eb97387bb683aa78"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.0/agent-notion-linux-amd64.tar.gz"
      sha256 "f438dc2484fcc1fe2e63f1d2c10edf17d64208bcb8a7c3aa6bf9c9210cc2b30d"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
