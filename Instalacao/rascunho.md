instalar sdkman
    curl -s "https://get.sdkman.io" | bash
    source "/Users/jbsilva/.sdkman/bin/sdkman-init.sh"
    rodar sdk list java
        para verificar versoes do java disponiveis
        localizar a versao desejada do java e copiar o Identifier dela
        pressione Q para sair da lista
    execute sdk install java <id da versao copiada> (jdk8: 8.0.372-amzn | jdk11: 11.0.19-amzn)
    ao instalar a segunda versao o sdk ira perguntar se deseja setar essa nova versao como padrao
    para alternar entre versoes usa sdk use java <id da versao>
         em caso de erro no compaudit usar comando
            compaudit - para ver as pastas que apresentam erro (se nao aparecer nada nao ha problemas)
            sudo compaudit | xargs chown -R "$(whoami)" OU compaudit | xargs sudo chown -R "$(whoami)" - para resolver
criando atalho para alterar versoes do jdk
    