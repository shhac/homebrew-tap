class Gt2gh < Formula
  desc "Bridge Graphite-managed linear stacks to GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.10.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "21912beac0e992bbbcc31e3dab1a5f0bff087d126892c93b6ee5211ecd73e233"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.10.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "ea3370fdfbe7b9d8f255a3084bd26e26962830a54407311b3f59ac38cdc7e7de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.10.0/gt2gh-linux-arm64.tar.gz"
      sha256 "efbc1a0b64df1d8c756e4d95f8b1f17175ccaf26448160f56b7c52e608063032"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.10.0/gt2gh-linux-amd64.tar.gz"
      sha256 "59fdd50a2f36efd3022ec36354a7a27f0335174dd25475859d0f3ee792fe0d27"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a linear Graphite stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
