import subprocess

def build_metadata_value(key):
    process = subprocess.run(
        ["buildkite-agent", "meta-data", "get", key],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    
    if process.returncode != 0:
        print("⚠️ Failed to get metadata:")
        print(process.stderr)
    else:
        print(f"✅ Metadata value: {process.stdout.strip()}")

if name == "main":
    build_metadata_value("test-key")
