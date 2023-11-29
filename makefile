
all : clean test

clean:
	rm -rf tests/output
	rm -f .nextflow.log*
	rm -rf .nextflow*

test:
	bash test/scripts/test_00_help.sh
	bash test/scripts/test_00_initialize.sh
	bash test/scripts/test_02.sh
	bash test/scripts/test_01.sh
	bash test/scripts/test_03.sh
	bash test/scripts/test_04.sh
	bash test/scripts/test_05.sh
	bash test/scripts/test_06.sh
	bash test/scripts/test_07.sh
	bash test/scripts/test_08.sh
	bash test/scripts/test_09.sh
	bash test/scripts/test_10.sh
	bash test/scripts/test_11.sh
	bash test/scripts/test_12.sh
	bash test/scripts/test_13.sh
	bash test/scripts/test_14.sh
	bash test/scripts/test_15.sh
	bash test/scripts/test_16.sh
	bash test/scripts/test_python_unit_test.sh
