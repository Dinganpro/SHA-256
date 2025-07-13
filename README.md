# SHA-256
# SHA-256 Hardware Implementation

This repository contains a Verilog-based simulation of the SHA-256 cryptographic hash function, complete with a functional testbench and performance validation report.

## 📁 Files Included

| File Name              | Description                                   |
|------------------------|-----------------------------------------------|
| `sha256_preprocessing.v` | Preprocessing module for message padding and formatting |
| `sha256_core.v`          | Core SHA-256 compression logic (64 rounds)   |
| `sha256_top.v`           | Top-level integration module                 |
| `sha256_testbench.v`     | Testbench for validating functionality       |
| `final_report.pdf`       | Project report including simulation results  |

## 🧪 Test Vectors

The testbench includes:
- ✅ Empty string hash test
- ✅ Standard test vector `"abc"`

## ✅ Expected Outputs

- Empty string → `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`
- `"abc"` → `ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad`

## 🛠️ Usage (Vivado XSim)

1. Add the `.v` files to your Vivado project.
2. Set `sha256_testbench.v` as the simulation top module.
3. Run simulation and observe output in the log or waveform viewer.

## 👥 Authors

- Allen Antony Fernandez  
- Athul P R  
- Jasmine Baby  

## 📄 License

This project is for educational purposes only.
