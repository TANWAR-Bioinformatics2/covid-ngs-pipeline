{"payload":{"allShortcutsEnabled":false,"fileTree":{"test/scripts":{"items":[{"name":"test_00_help.sh","path":"test/scripts/test_00_help.sh","contentType":"file"},{"name":"test_00_test_mode.sh","path":"test/scripts/test_00_test_mode.sh","contentType":"file"},{"name":"test_01.sh","path":"test/scripts/test_01.sh","contentType":"file"},{"name":"test_02.sh","path":"test/scripts/test_02.sh","contentType":"file"},{"name":"test_03.sh","path":"test/scripts/test_03.sh","contentType":"file"},{"name":"test_04.sh","path":"test/scripts/test_04.sh","contentType":"file"},{"name":"test_05.sh","path":"test/scripts/test_05.sh","contentType":"file"},{"name":"test_06.sh","path":"test/scripts/test_06.sh","contentType":"file"},{"name":"test_07.sh","path":"test/scripts/test_07.sh","contentType":"file"},{"name":"test_08.sh","path":"test/scripts/test_08.sh","contentType":"file"},{"name":"test_09.sh","path":"test/scripts/test_09.sh","contentType":"file"},{"name":"test_10.sh","path":"test/scripts/test_10.sh","contentType":"file"},{"name":"test_11.sh","path":"test/scripts/test_11.sh","contentType":"file"},{"name":"test_12.sh","path":"test/scripts/test_12.sh","contentType":"file"},{"name":"test_13.sh","path":"test/scripts/test_13.sh","contentType":"file"},{"name":"test_python_unit_tests.sh","path":"test/scripts/test_python_unit_tests.sh","contentType":"file"}],"totalCount":16},"test":{"items":[{"name":"scripts","path":"test/scripts","contentType":"directory"},{"name":"test_data","path":"test/test_data","contentType":"directory"}],"totalCount":2},"":{"items":[{"name":".github","path":".github","contentType":"directory"},{"name":"bin","path":"bin","contentType":"directory"},{"name":"images","path":"images","contentType":"directory"},{"name":"modules","path":"modules","contentType":"directory"},{"name":"reference","path":"reference","contentType":"directory"},{"name":"test","path":"test","contentType":"directory"},{"name":".gitignore","path":".gitignore","contentType":"file"},{"name":".gitlab-ci.yml","path":".gitlab-ci.yml","contentType":"file"},{"name":"CONTRIBUTING.md","path":"CONTRIBUTING.md","contentType":"file"},{"name":"LICENSE","path":"LICENSE","contentType":"file"},{"name":"Makefile","path":"Makefile","contentType":"file"},{"name":"README.md","path":"README.md","contentType":"file"},{"name":"main.nf","path":"main.nf","contentType":"file"},{"name":"nextflow.config","path":"nextflow.config","contentType":"file"}],"totalCount":14}},"fileTreeProcessingTime":5.5321299999999995,"foldersToFetch":[],"reducedMotionEnabled":null,"repo":{"id":707141953,"defaultBranch":"master","name":"covid-ngs-pipeline","ownerLogin":"TANWAR-Bioinformatics2","currentUserCanPush":false,"isFork":false,"isEmpty":false,"createdAt":"2021-06-07T13:07:53.000Z","ownerAvatar":"https://avatars.githubusercontent.com/u/30108370?v=4","public":true,"private":false,"isOrgOwned":true},"symbolsExpanded":false,"treeExpanded":true,"refInfo":{"name":"master","listCacheKey":"v0:1695375573.0","canEdit":false,"refType":"branch","currentOid":"6d95e042e8719a11891f953e2685d871803bfd8f"},"path":"test/scripts/test_01.sh","currentUser":null,"blob":{"rawLines":["#!/bin/bash","","##################################################################################","# FASTQ input","# paired-end reads","##################################################################################","echo \"Running Covid pipeline test 1\"","source bin/assert.sh","output=test/output/test1","nextflow main.nf -profile test,conda --name test_data \\","\t--output $output \\","\t--fastq1 test/test_data/test_data_1.fastq.gz \\","\t--fastq2 test/test_data/test_data_2.fastq.gz --keep_intermediate","","test -s $output/test_data.bcftools.vcf.gz || { echo \"Missing VCF output file!\"; exit 1; }","test -s $output/test_data.gatk.vcf.gz || { echo \"Missing VCF output file!\"; exit 1; }","test -s $output/test_data.lofreq.vcf.gz || { echo \"Missing VCF output file!\"; exit 1; }","test -s $output/test_data.lofreq.vcf.gz.tbi || { echo \"Missing VCF index output file!\"; exit 1; }","test -s $output/test_data.ivar.vcf.gz || { echo \"Missing VCF output file!\"; exit 1; }","test -s $output/test_data.ivar.tsv || { echo \"Missing VCF output file!\"; exit 1; }","test -s $output/test_data.fastp_stats.json || { echo \"Missing VCF output file!\"; exit 1; }","test -s $output/test_data.fastp_stats.html || { echo \"Missing VCF output file!\"; exit 1; }","test -s $output/test_data.coverage.tsv || { echo \"Missing coverage output file!\"; exit 1; }","test -s $output/test_data.depth.tsv || { echo \"Missing depth output file!\"; exit 1; }","test -s $output/test_data.lofreq.pangolin.csv || { echo \"Missing pangolin output file!\"; exit 1; }","test -s $output/test_data.lofreq.fasta || { echo \"Missing FASTA output file!\"; exit 1; }","test -s $output/test_data.gatk.fasta || { echo \"Missing FASTA output file!\"; exit 1; }","test -s $output/test_data.bcftools.fasta || { echo \"Missing FASTA output file!\"; exit 1; }","test -s $output/test_data.ivar.fasta || { echo \"Missing FASTA output file!\"; exit 1; }","","assert_eq `zcat $output/test_data.lofreq.vcf.gz | grep -v '#' | wc -l` 54 \"Wrong number of variants\"","assert_eq `zcat $output/test_data.lofreq.vcf.gz | grep -v '#' | grep 'vafator_af' | wc -l` 54 \"Wrong number of variants\"","assert_eq `zcat $output/test_data.lofreq.vcf.gz | grep -v '#' | grep PASS | wc -l` 2 \"Wrong number of variants\"","assert_eq `zcat $output/test_data.bcftools.vcf.gz | grep -v '#' | wc -l` 13 \"Wrong number of variants\"","assert_eq `zcat $output/test_data.gatk.vcf.gz | grep -v '#' | wc -l` 11 \"Wrong number of variants\"","","assert_eq `cat $output/test_data.lofreq.pangolin.csv |  wc -l` 2 \"Wrong number of pangolin results\""],"stylingDirectives":[[{"start":0,"end":11,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[],[{"start":0,"end":82,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":13,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":18,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":82,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":5,"end":40,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":39,"end":40,"cssClass":"pl-pds"}],[{"start":0,"end":6,"cssClass":"pl-c1"}],[],[],[{"start":10,"end":17,"cssClass":"pl-smi"}],[],[],[],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":42,"end":44,"cssClass":"pl-k"},{"start":47,"end":51,"cssClass":"pl-c1"},{"start":52,"end":78,"cssClass":"pl-s"},{"start":52,"end":53,"cssClass":"pl-pds"},{"start":77,"end":78,"cssClass":"pl-pds"},{"start":78,"end":79,"cssClass":"pl-k"},{"start":80,"end":84,"cssClass":"pl-c1"},{"start":86,"end":87,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":38,"end":40,"cssClass":"pl-k"},{"start":43,"end":47,"cssClass":"pl-c1"},{"start":48,"end":74,"cssClass":"pl-s"},{"start":48,"end":49,"cssClass":"pl-pds"},{"start":73,"end":74,"cssClass":"pl-pds"},{"start":74,"end":75,"cssClass":"pl-k"},{"start":76,"end":80,"cssClass":"pl-c1"},{"start":82,"end":83,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":40,"end":42,"cssClass":"pl-k"},{"start":45,"end":49,"cssClass":"pl-c1"},{"start":50,"end":76,"cssClass":"pl-s"},{"start":50,"end":51,"cssClass":"pl-pds"},{"start":75,"end":76,"cssClass":"pl-pds"},{"start":76,"end":77,"cssClass":"pl-k"},{"start":78,"end":82,"cssClass":"pl-c1"},{"start":84,"end":85,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":44,"end":46,"cssClass":"pl-k"},{"start":49,"end":53,"cssClass":"pl-c1"},{"start":54,"end":86,"cssClass":"pl-s"},{"start":54,"end":55,"cssClass":"pl-pds"},{"start":85,"end":86,"cssClass":"pl-pds"},{"start":86,"end":87,"cssClass":"pl-k"},{"start":88,"end":92,"cssClass":"pl-c1"},{"start":94,"end":95,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":38,"end":40,"cssClass":"pl-k"},{"start":43,"end":47,"cssClass":"pl-c1"},{"start":48,"end":74,"cssClass":"pl-s"},{"start":48,"end":49,"cssClass":"pl-pds"},{"start":73,"end":74,"cssClass":"pl-pds"},{"start":74,"end":75,"cssClass":"pl-k"},{"start":76,"end":80,"cssClass":"pl-c1"},{"start":82,"end":83,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":35,"end":37,"cssClass":"pl-k"},{"start":40,"end":44,"cssClass":"pl-c1"},{"start":45,"end":71,"cssClass":"pl-s"},{"start":45,"end":46,"cssClass":"pl-pds"},{"start":70,"end":71,"cssClass":"pl-pds"},{"start":71,"end":72,"cssClass":"pl-k"},{"start":73,"end":77,"cssClass":"pl-c1"},{"start":79,"end":80,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":43,"end":45,"cssClass":"pl-k"},{"start":48,"end":52,"cssClass":"pl-c1"},{"start":53,"end":79,"cssClass":"pl-s"},{"start":53,"end":54,"cssClass":"pl-pds"},{"start":78,"end":79,"cssClass":"pl-pds"},{"start":79,"end":80,"cssClass":"pl-k"},{"start":81,"end":85,"cssClass":"pl-c1"},{"start":87,"end":88,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":43,"end":45,"cssClass":"pl-k"},{"start":48,"end":52,"cssClass":"pl-c1"},{"start":53,"end":79,"cssClass":"pl-s"},{"start":53,"end":54,"cssClass":"pl-pds"},{"start":78,"end":79,"cssClass":"pl-pds"},{"start":79,"end":80,"cssClass":"pl-k"},{"start":81,"end":85,"cssClass":"pl-c1"},{"start":87,"end":88,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":39,"end":41,"cssClass":"pl-k"},{"start":44,"end":48,"cssClass":"pl-c1"},{"start":49,"end":80,"cssClass":"pl-s"},{"start":49,"end":50,"cssClass":"pl-pds"},{"start":79,"end":80,"cssClass":"pl-pds"},{"start":80,"end":81,"cssClass":"pl-k"},{"start":82,"end":86,"cssClass":"pl-c1"},{"start":88,"end":89,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":36,"end":38,"cssClass":"pl-k"},{"start":41,"end":45,"cssClass":"pl-c1"},{"start":46,"end":74,"cssClass":"pl-s"},{"start":46,"end":47,"cssClass":"pl-pds"},{"start":73,"end":74,"cssClass":"pl-pds"},{"start":74,"end":75,"cssClass":"pl-k"},{"start":76,"end":80,"cssClass":"pl-c1"},{"start":82,"end":83,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":46,"end":48,"cssClass":"pl-k"},{"start":51,"end":55,"cssClass":"pl-c1"},{"start":56,"end":87,"cssClass":"pl-s"},{"start":56,"end":57,"cssClass":"pl-pds"},{"start":86,"end":87,"cssClass":"pl-pds"},{"start":87,"end":88,"cssClass":"pl-k"},{"start":89,"end":93,"cssClass":"pl-c1"},{"start":95,"end":96,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":39,"end":41,"cssClass":"pl-k"},{"start":44,"end":48,"cssClass":"pl-c1"},{"start":49,"end":77,"cssClass":"pl-s"},{"start":49,"end":50,"cssClass":"pl-pds"},{"start":76,"end":77,"cssClass":"pl-pds"},{"start":77,"end":78,"cssClass":"pl-k"},{"start":79,"end":83,"cssClass":"pl-c1"},{"start":85,"end":86,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":37,"end":39,"cssClass":"pl-k"},{"start":42,"end":46,"cssClass":"pl-c1"},{"start":47,"end":75,"cssClass":"pl-s"},{"start":47,"end":48,"cssClass":"pl-pds"},{"start":74,"end":75,"cssClass":"pl-pds"},{"start":75,"end":76,"cssClass":"pl-k"},{"start":77,"end":81,"cssClass":"pl-c1"},{"start":83,"end":84,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":41,"end":43,"cssClass":"pl-k"},{"start":46,"end":50,"cssClass":"pl-c1"},{"start":51,"end":79,"cssClass":"pl-s"},{"start":51,"end":52,"cssClass":"pl-pds"},{"start":78,"end":79,"cssClass":"pl-pds"},{"start":79,"end":80,"cssClass":"pl-k"},{"start":81,"end":85,"cssClass":"pl-c1"},{"start":87,"end":88,"cssClass":"pl-k"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":8,"end":15,"cssClass":"pl-smi"},{"start":37,"end":39,"cssClass":"pl-k"},{"start":42,"end":46,"cssClass":"pl-c1"},{"start":47,"end":75,"cssClass":"pl-s"},{"start":47,"end":48,"cssClass":"pl-pds"},{"start":74,"end":75,"cssClass":"pl-pds"},{"start":75,"end":76,"cssClass":"pl-k"},{"start":77,"end":81,"cssClass":"pl-c1"},{"start":83,"end":84,"cssClass":"pl-k"}],[],[{"start":10,"end":70,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":16,"end":23,"cssClass":"pl-smi"},{"start":48,"end":49,"cssClass":"pl-k"},{"start":58,"end":61,"cssClass":"pl-s"},{"start":58,"end":59,"cssClass":"pl-pds"},{"start":60,"end":61,"cssClass":"pl-pds"},{"start":62,"end":63,"cssClass":"pl-k"},{"start":69,"end":70,"cssClass":"pl-pds"},{"start":74,"end":100,"cssClass":"pl-s"},{"start":74,"end":75,"cssClass":"pl-pds"},{"start":99,"end":100,"cssClass":"pl-pds"}],[{"start":10,"end":90,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":16,"end":23,"cssClass":"pl-smi"},{"start":48,"end":49,"cssClass":"pl-k"},{"start":58,"end":61,"cssClass":"pl-s"},{"start":58,"end":59,"cssClass":"pl-pds"},{"start":60,"end":61,"cssClass":"pl-pds"},{"start":62,"end":63,"cssClass":"pl-k"},{"start":69,"end":81,"cssClass":"pl-s"},{"start":69,"end":70,"cssClass":"pl-pds"},{"start":80,"end":81,"cssClass":"pl-pds"},{"start":82,"end":83,"cssClass":"pl-k"},{"start":89,"end":90,"cssClass":"pl-pds"},{"start":94,"end":120,"cssClass":"pl-s"},{"start":94,"end":95,"cssClass":"pl-pds"},{"start":119,"end":120,"cssClass":"pl-pds"}],[{"start":10,"end":82,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":16,"end":23,"cssClass":"pl-smi"},{"start":48,"end":49,"cssClass":"pl-k"},{"start":58,"end":61,"cssClass":"pl-s"},{"start":58,"end":59,"cssClass":"pl-pds"},{"start":60,"end":61,"cssClass":"pl-pds"},{"start":62,"end":63,"cssClass":"pl-k"},{"start":74,"end":75,"cssClass":"pl-k"},{"start":81,"end":82,"cssClass":"pl-pds"},{"start":85,"end":111,"cssClass":"pl-s"},{"start":85,"end":86,"cssClass":"pl-pds"},{"start":110,"end":111,"cssClass":"pl-pds"}],[{"start":10,"end":72,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":16,"end":23,"cssClass":"pl-smi"},{"start":50,"end":51,"cssClass":"pl-k"},{"start":60,"end":63,"cssClass":"pl-s"},{"start":60,"end":61,"cssClass":"pl-pds"},{"start":62,"end":63,"cssClass":"pl-pds"},{"start":64,"end":65,"cssClass":"pl-k"},{"start":71,"end":72,"cssClass":"pl-pds"},{"start":76,"end":102,"cssClass":"pl-s"},{"start":76,"end":77,"cssClass":"pl-pds"},{"start":101,"end":102,"cssClass":"pl-pds"}],[{"start":10,"end":68,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":16,"end":23,"cssClass":"pl-smi"},{"start":46,"end":47,"cssClass":"pl-k"},{"start":56,"end":59,"cssClass":"pl-s"},{"start":56,"end":57,"cssClass":"pl-pds"},{"start":58,"end":59,"cssClass":"pl-pds"},{"start":60,"end":61,"cssClass":"pl-k"},{"start":67,"end":68,"cssClass":"pl-pds"},{"start":72,"end":98,"cssClass":"pl-s"},{"start":72,"end":73,"cssClass":"pl-pds"},{"start":97,"end":98,"cssClass":"pl-pds"}],[],[{"start":10,"end":62,"cssClass":"pl-s"},{"start":10,"end":11,"cssClass":"pl-pds"},{"start":15,"end":22,"cssClass":"pl-smi"},{"start":53,"end":54,"cssClass":"pl-k"},{"start":61,"end":62,"cssClass":"pl-pds"},{"start":65,"end":99,"cssClass":"pl-s"},{"start":65,"end":66,"cssClass":"pl-pds"},{"start":98,"end":99,"cssClass":"pl-pds"}]],"csv":null,"csvError":null,"dependabotInfo":{"showConfigurationBanner":false,"configFilePath":null,"networkDependabotPath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/network/updates","dismissConfigurationNoticePath":"/settings/dismiss-notice/dependabot_configuration_notice","configurationNoticeDismissed":null,"repoAlertsPath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/security/dependabot","repoSecurityAndAnalysisPath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/settings/security_analysis","repoOwnerIsOrg":true,"currentUserCanAdminRepo":false},"displayName":"test_01.sh","displayUrl":"https://github.com/TANWAR-Bioinformatics2/covid-ngs-pipeline/blob/master/test/scripts/test_01.sh?raw=true","headerInfo":{"blobSize":"2.42 KB","deleteInfo":{"deleteTooltip":"You must be signed in to make or propose changes"},"editInfo":{"editTooltip":"You must be signed in to make or propose changes"},"ghDesktopPath":"https://desktop.github.com","gitLfsPath":null,"onBranch":true,"shortPath":"5b23cf2","siteNavLoginPath":"/login?return_to=https%3A%2F%2Fgithub.com%2FTANWAR-Bioinformatics2%2Fcovid-ngs-pipeline%2Fblob%2Fmaster%2Ftest%2Fscripts%2Ftest_01.sh","isCSV":false,"isRichtext":false,"toc":null,"lineInfo":{"truncatedLoc":"37","truncatedSloc":"33"},"mode":"file"},"image":false,"isCodeownersFile":null,"isPlain":false,"isValidLegacyIssueTemplate":false,"issueTemplateHelpUrl":"https://docs.github.com/articles/about-issue-and-pull-request-templates","issueTemplate":null,"discussionTemplate":null,"language":"Shell","languageID":346,"large":false,"loggedIn":false,"newDiscussionPath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/discussions/new","newIssuePath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/issues/new","planSupportInfo":{"repoIsFork":null,"repoOwnedByCurrentUser":null,"requestFullPath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/blob/master/test/scripts/test_01.sh","showFreeOrgGatedFeatureMessage":null,"showPlanSupportBanner":null,"upgradeDataAttributes":null,"upgradePath":null},"publishBannersInfo":{"dismissActionNoticePath":"/settings/dismiss-notice/publish_action_from_dockerfile","dismissStackNoticePath":"/settings/dismiss-notice/publish_stack_from_file","releasePath":"/TANWAR-Bioinformatics2/covid-ngs-pipeline/releases/new?marketplace=true","showPublishActionBanner":false,"showPublishStackBanner":false},"renderImageOrRaw":false,"richText":null,"renderedFileInfo":null,"shortPath":null,"tabSize":8,"topBannersInfo":{"overridingGlobalFundingFile":false,"globalPreferredFundingPath":null,"repoOwner":"TANWAR-Bioinformatics2","repoName":"covid-ngs-pipeline","showInvalidCitationWarning":false,"citationHelpUrl":"https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-citation-files","showDependabotConfigurationBanner":false,"actionsOnboardingTip":null},"truncated":false,"viewable":true,"workflowRedirectUrl":null,"symbols":{"timedOut":false,"notAnalyzed":false,"symbols":[]}},"copilotInfo":null,"csrf_tokens":{"/TANWAR-Bioinformatics2/covid-ngs-pipeline/branches":{"post":"61O-EUXrgAkN681ojyAUxnHOJ5N4pc3L0B_NWtTw6NxgHX_o5alBqABSxd92IjKWZBcxAQEU7ghxf99gWv1TrQ"},"/repos/preferences":{"post":"Vtvv_3XaIQR3YBj2-Duh1k7k4hYQpdhPzhsAw6OggZ-H2_Ail3HwTFciLah5MPaT3evB3DTHyIWxyr1MEcZ94Q"}}},"title":"covid-ngs-pipeline/test/scripts/test_01.sh at master · TANWAR-Bioinformatics2/covid-ngs-pipeline"}