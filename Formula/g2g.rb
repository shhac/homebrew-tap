class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.42.0/g2g-darwin-arm64.tar.gz"
      sha256 "ecb2436825946b20f7828a677f5e5313604fa4a4acd662558ef5da5c97f58565"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.42.0/g2g-darwin-amd64.tar.gz"
      sha256 "7edd426ac351002188e68c99a9e3da3ba43d9cc6d3650f688c68111d43eeceb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.42.0/g2g-linux-arm64.tar.gz"
      sha256 "e9d59815d99a2993eabb40c2b769212394e17668411f7b9f0ef5afaad09dbf03"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.42.0/g2g-linux-amd64.tar.gz"
      sha256 "8fe402dc08258b8f714b36beca829f02a802a3d8591669165d3b82001a906ad7"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.42.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
