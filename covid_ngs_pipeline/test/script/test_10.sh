{"payload":{"allShortcutsEnabled":false,"fileTree":{"tests/scripts":{"items":[{"name":"test_00_help.sh","path":"tests/scripts/test_00_help.sh","contentType":"file"},{"name":"test_00_test_mode.sh","path":"tests/scripts/test_00_test_mode.sh","contentType":"file"},{"name":"test_01.sh","path":"tests/scripts/test_01.sh","contentType":"file"},{"name":"test_02.sh","path":"tests/scripts/test_02.sh","contentType":"file"},{"name":"test_03.sh","path":"tests/scripts/test_03.sh","contentType":"file"},{"name":"test_04.sh","path":"tests/scripts/test_04.sh","contentType":"file"},{"name":"test_05.sh","path":"tests/scripts/test_05.sh","contentType":"file"},{"name":"test_06.sh","path":"tests/scripts/test_06.sh","contentType":"file"},{"name":"test_07.sh","path":"tests/scripts/test_07.sh","contentType":"file"},{"name":"test_08.sh","path":"tests/scripts/test_08.sh","contentType":"file"},{"name":"test_09.sh","path":"tests/scripts/test_09.sh","contentType":"file"},{"name":"test_10.sh","path":"tests/scripts/test_10.sh","contentType":"file"},{"name":"test_11.sh","path":"tests/scripts/test_11.sh","contentType":"file"},{"name":"test_12.sh","path":"tests/scripts/test_12.sh","contentType":"file"},{"name":"test_13.sh","path":"tests/scripts/test_13.sh","contentType":"file"},{"name":"test_python_unit_tests.sh","path":"tests/scripts/test_python_unit_tests.sh","contentType":"file"}],"totalCount":16},"tests":{"items":[{"name":"scripts","path":"tests/scripts","contentType":"directory"},{"name":"test_data","path":"tests/test_data","contentType":"directory"}],"totalCount":2},"":{"items":[{"name":".github","path":".github","contentType":"directory"},{"name":"bin","path":"bin","contentType":"directory"},{"name":"images","path":"images","contentType":"directory"},{"name":"modules","path":"modules","contentType":"directory"},{"name":"reference","path":"reference","contentType":"directory"},{"name":"tests","path":"tests","contentType":"directory"},{"name":".gitignore","path":".gitignore","contentType":"file"},{"name":".gitlab-ci.yml","path":".gitlab-ci.yml","contentType":"file"},{"name":"CONTRIBUTING.md","path":"CONTRIBUTING.md","contentType":"file"},{"name":"LICENSE","path":"LICENSE","contentType":"file"},{"name":"Makefile","path":"Makefile","contentType":"file"},{"name":"README.md","path":"README.md","contentType":"file"},{"name":"main.nf","path":"main.nf","contentType":"file"},{"name":"nextflow.config","path":"nextflow.config","contentType":"file"}],"totalCount":14}},"fileTreeProcessingTime":8.694662000000001,"foldersToFetch":[],"reducedMotionEnabled":null,"repo":{"id":374669617,"defaultBranch":"master","name":"covid-ngs-pipeline","ownerLogin":"TANWAR-Bioinformatics2","currentUserCanPush":false,"isFork":false,"isEmpty":false,"createdAt":"2021-06-07T13:07:53.000Z","ownerAvatar":"https://avatars.githubusercontent.com/u/30108370?v=4","public":true,"private":false,"isOrgOwned":true},"symbolsExpanded":false,"treeExpanded":true,"refInfo":{"name":"master","listCacheKey":"v0:1695375573.0","canEdit":false,"refType":"branch","currentOid":"6d95e042e8719a11891f953e2685d871803bfd8f"},"path":"tests/scripts/test_10.sh","currentUser":null,"blob":{"rawLines":["#!/bin/bash","","##################################################################################","# primer trimmming","##################################################################################","echo \"Running Covid pipeline test 10\"","source bin/assert.sh","output=tests/output/test10","echo -e \"test_data\\t\"`pwd`\"/tests/test_data/test_data_1.fastq.gz\\n\" > tests/test_data/test_input.txt","nextflow main.nf -profile test,conda --input_fastqs_list tests/test_data/test_input.txt \\","--library single --output $output \\","--primers tests/test_data/SARS-CoV-2.primer.bed","","test -s $output/test_data.lofreq.vcf.gz || { echo \"Missing VCF output file!\"; exit 1; }","test -s $output/test_data.fastp_stats.json || { echo \"Missing VCF output file!\"; exit 1; }","test -s $output/test_data.fastp_stats.html || { echo \"Missing VCF output file!\"; exit 1; }","test -s $output/test_data.coverage.tsv || { echo \"Missing coverage output file!\"; exit 1; }","test -s $output/test_data.depth.tsv || { echo \"Missing depth output file!\"; exit 1; }","test -s $output/test_data.lofreq.pangolin.csv || { echo \"Missing pangolin output file!\"; exit 1; }","test -s $output/test_data.lofreq.fasta || { echo \"Missing FASTA output file!\"; exit 1; }","","assert_eq `zcat $output/test_data.lofreq.vcf.gz | grep -v '#' | wc -l` 3 \"Wrong number of variants\"","assert_eq `zcat $output/test_data.lofreq.vcf.gz | grep -v '#' | grep PASS | wc -l` 0 \"Wrong number of variants\"","","assert_eq `cat $output/test_data.lofreq.pangolin.csv |  wc -l` 2 \"Wrong number of pangolin results\""],"stylingDirectives":[[{"start":0,"end":11,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[],[{"start":0,"end":82,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":18,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":82,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":5,"end":41,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":40,"end":41,"cssClass":"pl-pds"}],[{"start":0,"end":6,"cssClass":"pl-c1"}],[],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":21,"cssClass":"pl-s"},{"start":8,"end":9,"cssClass":"pl-pds"},{"start":20,"end":21,"cssClass":"pl-pds"},{"start":21,"end":26,"cssClass":"pl-s"},{"start":21,"end":22,"cssClass":"pl-pds"},{"start":25,"end":26,"cssClass":"pl-pds"},{"start":26,"end":67,"cssClass":"pl-s"},{"start":26,"end":27,"cssClass":"pl-pds"},{"start":66,"end":67,"cssClass":"pl-pds"},{"start":68,"end":69,"cssClass":"pl-k"}],[],[{"start":26,"end":33,"cssClass":"pl-smi"}],[],[],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":40,"end":42,"cssClass":"pl-k"},{"start":45,"end":49,"cssClass":"pl-c1"},{"start":50,"end":76,"cssClass":"pl-s"},{"start":50,"end":51,"cssClass":"pl-pds"},{"start":75,"end":76,"cssClass":"pl-pds"},{"start":76,"end":77,"cssClass":"pl-k"},{"start":78,"end":82,"cssClass":"pl-c1"},{"start":84,"end":85,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":43,"end":45,"cssClass":"pl-k"},{"start":48,"end":52,"cssClass":"pl-c1"},{"start":53,"end":79,"cssClass":"pl-s"},{"start":53,"end":54,"cssClass":"pl-pds"},{"start":78,"end":79,"cssClass":"pl-pds"},{"start":79,"end":80,"cssClass":"pl-k"},{"start":81,"end":85,"cssClass":"pl-c1"},{"start":87,"end":88,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":43,"end":45,"cssClass":"pl-k"},{"start":48,"end":52,"cssClass":"pl-c1"},{"start":53,"end":79,"cssClass":"pl-s"},{"start":53,"end":54,"cssClass":"pl-pds"},{"start":78,"end":79,"cssClass":"pl-pds"},{"start":79,"end":80,"cssClass":"pl-k"},{"start":81,"end":85,"cssClass":"pl-c1"},{"start":87,"end":88,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":39,"end":41,"cssClass":"pl-k"},{"start":44,"end":48,"cssClass":"pl-c1"},{"start":49,"end":80,"cssClass":"pl-s"},{"start":49,"end":50,"cssClass":"pl-pds"},{"start":79,"end":80,"cssClass":"pl-pds"},{"start":80,"end":81,"cssClass":"pl-k"},{"start":82,"end":86,"cssClass":"pl-c1"},{"start":88,"end":89,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":36,"end":38,"cssClass":"pl-k"},{"start":41,"end":45,"cssClass":"pl-c1"},{"start":46,"end":74,"cssClass":"pl-s"},{"start":46,"end":47,"cssClass":"pl-pds"},{"start":73,"end":74,"cssClass":"pl-pds"},{"start":74,"end":75,"cssClass":"pl-k"},{"start":76,"end":80,"cssClass":"pl-c1"},{"start":82,"end":83,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":46,"end":48,"cssClass":"pl-k"},{"start":51,"end":55,"cssClass":"pl-c1"},{"start":56,"end":87,"cssClass":"pl-s"},{"start":56,"end":57,"cssClass":"pl-pds"},{"start":86,"end":87,"cssClass":"pl-pds"},{"start":87,"end":88,"cssClass":"pl-k"},{"start":89,"end":93,"cssClass":"pl-c1"},{"start":95,"end":96,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":39,"end":41,"cssClass":"pl-k"},{"start":44,"end":48,"cssClass":"pl-c1"},{"start":49,"end":77,"cssClass":"pl-s"},{"start":49,"end":50,"cssClass":"pl-pds"},{"start":76,"end":77,"cssClass":"pl-pds"},{"start":77,"end":78,"cssClass":"pl-k"},{"start":79,"end":83,"cssClass":"pl-c1"},{"start":85,"end":86,"cssClass":"pl-k"}],[],[{"start":10,"end":70,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":16,"end":23,"cssClass":"pl-smi"},{"start":48,"end":49,"cssClass":"pl-k"},{"start":58,"end":61,"cssClass":"pl-s"},{"start":58,"end":59,"cssClass":"pl-pds"},{"start":60,"end":61,"cssClass":"pl-pds"},{"start":62,"end":63,"cssClass":"pl-k"},{"start":69,"end":70,"cssClass":"pl-pds"},{"start":73,"end":99,"cssClass":"pl-s"},{"start":73,"end":74,"cssClass":"pl-pds"},{"start":98,"end":99,"cssClass":"pl-pds"}],[{"start":10,"end":82,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":16,"end":23,"cssClass":"pl-smi"},{"start":48,"end":49,"cssClass":"pl-k"},{"start":58,"end":61,"cssClass":"pl-s"},{"start":58,"end":59,"cssClass":"pl-pds"},{"start":60,"end":61,"cssClass":"pl-pds"},{"start":62,"end":63,"cssClass":"pl-k"},{"start":74,"end":75,"cssClass":"pl-k"},{"start":81,"end":82,"cssClass":"pl-pds"},{"start":85,"end":111,"cssClass":"pl-s"},{"start":85,"end":86,"cssClass":"pl-pds"},{"start":110,"end":111,"cssClass":"pl-pds"}],[],[{"start":10,"end":62,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":15,"end":22,"cssClass":"pl-smi"},{"start":53,"end":54,"cssClass":"pl-k"},{"start":61,"end":62,"cssClass":"pl-pds"},{"start":65,"end":99,"cssClass":"pl-s"},{"start":65,"end":66,"cssClass":"pl-pds"},{"start":98,"end":99,"cssClass":"pl-pds"}]],"csv":null,"csvError":null,"dependabotInfo":{"showConfigurationBanner":false,"configFilePath":null,"networkDependabotPath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/network/updates","dismissConfigurationNoticePath":"/settings/dismiss-notice/dependabot_configuration_notice","configurationNoticeDismissed":null,"repoAlertsPath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/security/dependabot","repoSecurityAndAnalysisPath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/settings/security_analysis","repoOwnerIsOrg":true,"currentUserCanAdminRepo":false},"displayName":"test_10.sh","displayUrl":"https://github.com/TANWAR-Bioinformatics2/covid-ngs-pipeline/blob/master/tests/scripts/test_10.sh?raw=true","headerInfo":{"blobSize":"1.48 KB","deleteInfo":{"deleteTooltip":"You must be signed in to make or propose changes"},"editInfo":{"editTooltip":"You must be signed in to make or propose changes"},"ghDesktopPath":"https://desktop.github.com","gitLfsPath":null,"onBranch":true,"shortPath":"2aa01f0","siteNavLoginPath":"/login?return_to=https%3A%2F%2Fgithub.com%2FTANWAR-Bioinformatics2%2Fcovid-ngs-pipeline%2Fblob%2Fmaster%2Ftests%2Fscripts%2Ftest_10.sh","isCSV":false,"isRichtext":false,"toc":null,"lineInfo":{"truncatedLoc":"25","truncatedSloc":"21"},"mode":"file"},"image":false,"isCodeownersFile":null,"isPlain":false,"isValidLegacyIssueTemplate":false,"issueTemplateHelpUrl":"https://docs.github.com/articles/about-issue-and-pull-request-templates","issueTemplate":null,"discussionTemplate":null,"language":"Shell","languageID":346,"large":false,"loggedIn":false,"newDiscussionPath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/discussions/new","newIssuePath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/issues/new","planSupportInfo":{"repoIsFork":null,"repoOwnedByCurrentUser":null,"requestFullPath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/blob/master/tests/scripts/test_10.sh","showFreeOrgGatedFeatureMessage":null,"showPlanSupportBanner":null,"upgradeDataAttributes":null,"upgradePath":null},"publishBannersInfo":{"dismissActionNoticePath":"/settings/dismiss-notice/publish_action_from_dockerfile","dismissStackNoticePath":"/settings/dismiss-notice/publish_stack_from_file","releasePath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/releases/new?marketplace=true","showPublishActionBanner":false,"showPublishStackBanner":false},"renderImageOrRaw":false,"richText":null,"renderedFileInfo":null,"shortPath":null,"tabSize":8,"topBannersInfo":{"overridingGlobalFundingFile":false,"globalPreferredFundingPath":null,"repoOwner":"TANWAR-Bioinformatics2","repoName":"covid-ngs-pipeline","showInvalidCitationWarning":false,"citationHelpUrl":"https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-citation-files","showDependabotConfigurationBanner":false,"actionsOnboardingTip":null},"truncated":false,"viewable":true,"workflowRedirectUrl":null,"symbols":{"timedOut":false,"notAnalyzed":false,"symbols":[]}},"copilotInfo":null,"csrf_tokens":{"/TANWAR-Bioinformatics2/covid-ngs-pipeline/branches":{"post":"yp97_2Tacg-OrQ1pDOq0lUUslEAB9lLrOeAllmd4qfZEedJKhSJX5z0T0aYld3T2YEuO6fcHANrhqfjMHl6GWw"},"/repos/preferences":{"post":"rOQnzVO0_gDoc4QNj4JtRRjQa5qQsFlYLDaNCDidxSSQV5yHj5GskNPM5D76zpWNO-xWpAIzBvlmTiDWNxwafA"}}},"title":"covid-ngs-pipeline/tests/scripts/test_10.sh at master · TANWAR-Bioinformatics2/covid-ngs-pipeline"}