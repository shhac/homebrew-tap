class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.10.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.0/agent-notion-darwin-arm64.tar.gz"
      sha256 "b8de07724f1daab10de75bee0c079b39936f8134d3f2d9818ee6f09815bc94fd"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.0/agent-notion-darwin-amd64.tar.gz"
      sha256 "bb913dfd80fc26d583c8f417372f39c0e9424d1457497a1e235fb604a8cc5c19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.0/agent-notion-linux-arm64.tar.gz"
      sha256 "8b16a2202398b54d3d2a2d8bd5f2e7b2a64fc9c4a305210118a56f4c63f3303c"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.10.0/agent-notion-linux-amd64.tar.gz"
      sha256 "8e05ba27380e53b2b6ac765f26663ce08c3d71be74ed602e0bf25f16bfdeca61"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
