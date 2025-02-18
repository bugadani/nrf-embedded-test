$targets = @("nrf51422", "nrf52832", "nrf52833")

mkdir output -ErrorAction SilentlyContinue

# For each target, call cargo
foreach ($target in $targets) {
    $output = cargo $target --release --test example_test --no-run --message-format=json

    # parse json output of second to last line
    $json = $output[-2] | ConvertFrom-Json
    cp $json.executable "output/$target"
}
