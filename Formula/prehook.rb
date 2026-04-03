class Prehook < Formula
  desc "Local Git hook security gates — stop secrets before they ship"
  homepage "https://github.com/arunsanna/prehook"
  url "https://github.com/arunsanna/prehook/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2e6989ae2f6d416a0ae0a7b79d841433b128da47549d4e09976980eda9c14d62"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prehook version")
  end
end
