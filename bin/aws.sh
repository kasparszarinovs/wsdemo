./bin/run_all_tests.sh -config config/aws-10k-cy.config
sleep 30
./bin/run_all_tests.sh -config config/aws-1k-cy.config
sleep 30
./bin/run_all_tests.sh -config config/aws-1c-cy.config
