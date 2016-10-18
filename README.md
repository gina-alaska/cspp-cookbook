# cspp cookbook

This is a resource cookbook for installing cspp packages.

## Example usage

Install cspp_sdr, with CACHE and STATIC ancillary, and patches to 2.2.3

```
cspp_package "SDR" do
  source 'http://mirrors.example.org/CSPP'
  version '2.2'
  ancillary %w{CACHE STATIC}
  patch '2.2.3'
end
```


# WARNING
This cookbook has been rewritten to be a resource cookbook in 3.0.0

If you would like to use the old recipe method, use an older 2.X version.


