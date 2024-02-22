# Define o diretório de destino
$strDir = "C:\temp\test1\"

# Remove todos os arquivos existentes no diretório
Get-ChildItem $strDir | Remove-Item -Force

# Cria 200 arquivos no diretório com o texto "something"
1..200 | ForEach-Object {
    $strPath = $strDir + $_ + ".txt"
    "something" | Out-File -FilePath $strPath | Out-Null
}

# Mede o tempo de execução do seguinte bloco de código
Measure-Command {
    # Para cada número de 1 a 101
    1..101 | ForEach-Object {
        $strPath = $strDir + $_ + ".txt"
        $strNewPath = $strPath + ".chng"
        
        # Adiciona o texto "changed" ao arquivo existente e o renomeia
        "changed" | Out-File -FilePath $strPath -Append
        Rename-Item -Path $strPath -NewName $strNewPath
    }
}
