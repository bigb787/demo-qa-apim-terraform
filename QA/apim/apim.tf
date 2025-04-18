module "apim"  {
    source = "../../modules/apim/"
	apim-name = "apim-qa-test-demo"
	env = "QA"
	logger = "demo-qa-app_insights"
}