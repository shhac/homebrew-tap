class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.10.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "08b55ff05ca617698daf7629cd1a2fed2f7841b99b5ab186dbcb7a671ab3fbc2"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.10.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "075feb27ce0e48f1cc8baf2b5d4b0e14d6db8dabfb93c9795ffbecb39a252861"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.10.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "9af80f1476011fda62d9a43115565ef2b2e9bba89af36e46e43eb9d8c0c63f54"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.10.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "60639043885852311dbc105460300ba32ecd4716bdc7bca2b38bee6c96997154"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
