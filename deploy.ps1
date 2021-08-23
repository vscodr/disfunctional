$resourceGroup = @{
    Name = 'sql-test-rg';
    Location = 'japanwest';

}

New-AzResourceGroup -Name $resourceGroup.Name -Location $resourceGroup.Location
$template = @{
    Filename = '.\armDeploy.json';
    Parameters = @{
        serverName = 'testDBServer';
        dbCount = 2;
        startIP = '0.0.0.0'        ;
        endIP = '0.0.0.0';

    }
}

New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup.Name -name testSQLServerDeployment -TemplateFile $template.Filename -TemplateParameterObject $template.Parameters