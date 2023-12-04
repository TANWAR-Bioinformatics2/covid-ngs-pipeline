all : clean test

clean:
	rm -rf tests/output
	rm -f .nextflow.log*
	rm -rf .nextflow*

test:
	bash tests/scripts/test_00_help.sh
	bash tests/scripts/test_00_initialize.sh
	bash tests/scripts/test_02.sh
	bash tests/scripts/test_01.sh
	bash tests/scripts/test_03.sh
	bash tests/scripts/test_04.sh
	bash tests/scripts/test_05.sh
	bash tests/scripts/test_06.sh
	bash tests/scripts/test_07.sh
	bash tests/scripts/test_08.sh
	bash tests/scripts/test_09.sh
	bash tests/scripts/test_10.sh
	bash tests/scripts/test_11.sh
	bash tests/scripts/test_12.sh
	bash tests/scripts/test_13.sh
	bash tests/scripts/test_14.sh
	bash tests/scripts/test_15.sh
	bash tests/scripts/test_16.sh
	bash tests/scripts/test_python_unit_tests.sh
check:
	test -s output/tests/sample1/test_data_1.fastq.gz || { echo "Missing test 1 output file!"; exit 1; }
	test -s output/tests/sample2/test_data_2.fastq.gz || { echo "Missing test 2 output file!"; exit 1; }
	
        test -s output/tests/sample1/test_data_1.fasta || { echo "Missing test 1 output file!"; exit 1; }
	test -s output/tests/sample1/test_data_2.fasta || { echo "Missing test 1 output file!"; exit 1; }
	test -s output/tests/sample1/test_data_1.fastq || { echo "Missing test 1 output file!"; exit 1; }
	test -s output/tests/sample1/test_data_2.fastq || { echo "Missing test 1 output file!"; exit 1; }
	test -s output/tests/sample2/test_data_1.fasta || { echo "Missing test 2 output file!"; exit 1; }
	test -s output/tests/sample2/test_data_2.fasta || { echo "Missing test 2 output file!"; exit 1; }
	test -s output/tests/sample2/test_data_1.fastq || { echo "Missing test 2 output file!"; exit 1; }
	test -s output/tests/sample2/test_data_2.fastq || { echo "Missing test 2 output file!"; exit 1; }
