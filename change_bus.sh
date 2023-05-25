#lint bus replace
sed -i 's/lint_req/data_req/g' *
sed -i 's/lint_we/data_we/g' *
sed -i 's/lint_be/data_be/g' *
sed -i 's/lint_addr/data_addr/g' *
sed -i 's/lint_wdata/data_wdata/g' *
sed -i 's/lint_gnt/data_gnt/g' *
sed -i 's/lint_rvalid/data_r_valid/g' *
sed -i 's/lint_rdata/data_r_rdata/g' *
